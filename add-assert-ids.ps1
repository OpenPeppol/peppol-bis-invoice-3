# PowerShell script to add assert IDs to assert text content.
# Only adds the ID if it doesn't already exist in the assert message.
# Uses targeted text replacement to avoid XML reserialization side effects.

param(
    [string[]]$FilePaths = @(
        "rules\sch\PEPPOL-EN16931-UBL-SB.sch"
    )
)

function Get-LineStartIndexes {
    param([string]$Text)

    $lineStarts = New-Object "System.Collections.Generic.List[int]"
    $lineStarts.Add(0)

    for ($i = 0; $i -lt $Text.Length; $i++) {
        if ($Text[$i] -eq "`n") {
            $lineStarts.Add($i + 1)
        }
    }

    return $lineStarts
}

function Get-AbsoluteIndex {
    param(
        [System.Collections.Generic.List[int]]$LineStarts,
        [int]$LineNumber,
        [int]$LinePosition
    )

    if ($LineNumber -le 0 -or $LineNumber -gt $LineStarts.Count) {
        return -1
    }

    return $LineStarts[$LineNumber - 1] + [Math]::Max($LinePosition - 1, 0)
}

$totalModified = 0
$totalSkipped = 0

foreach ($FilePath in $FilePaths) {
    Write-Host "`nProcessing: $FilePath"

    $resolvedPath = (Resolve-Path $FilePath -ErrorAction Stop).Path

    # Read using detected source encoding to avoid changing file encoding.
    $reader = [System.IO.StreamReader]::new($resolvedPath, $true)
    try {
        $content = $reader.ReadToEnd()
        $encoding = $reader.CurrentEncoding
    }
    finally {
        $reader.Dispose()
    }

    $modified = 0
    $skipped = 0

    $lineStarts = Get-LineStartIndexes -Text $content
    $insertions = New-Object "System.Collections.Generic.List[psobject]"

    $settings = [System.Xml.XmlReaderSettings]::new()
    $settings.IgnoreWhitespace = $false
    $settings.IgnoreComments = $false
    $settings.DtdProcessing = [System.Xml.DtdProcessing]::Parse

    $stringReader = [System.IO.StringReader]::new($content)
    $xmlReader = [System.Xml.XmlReader]::Create($stringReader, $settings)

    $schematronNs = "http://purl.oclc.org/dsdl/schematron"
    $insideAssert = $false
    $pendingAssertCheck = $false
    $currentAssertId = $null

    try {
        while ($xmlReader.Read()) {
            if ($xmlReader.NodeType -eq [System.Xml.XmlNodeType]::Element -and
                $xmlReader.LocalName -eq "assert" -and
                $xmlReader.NamespaceURI -eq $schematronNs) {

                $id = $xmlReader.GetAttribute("id")

                if (-not [string]::IsNullOrWhiteSpace($id) -and -not $xmlReader.IsEmptyElement) {
                    $insideAssert = $true
                    $pendingAssertCheck = $true
                    $currentAssertId = $id
                }
                else {
                    $insideAssert = $false
                    $pendingAssertCheck = $false
                    $currentAssertId = $null
                }

                continue
            }

            if (-not $insideAssert) {
                continue
            }

            $isTextNode =
                $xmlReader.NodeType -eq [System.Xml.XmlNodeType]::Text -or
                $xmlReader.NodeType -eq [System.Xml.XmlNodeType]::CDATA -or
                $xmlReader.NodeType -eq [System.Xml.XmlNodeType]::Whitespace -or
                $xmlReader.NodeType -eq [System.Xml.XmlNodeType]::SignificantWhitespace

            if ($pendingAssertCheck -and $isTextNode) {
                $text = $xmlReader.Value
                $pattern = "^\s*\[$([regex]::Escape($currentAssertId))\]"

                if ($text -match $pattern) {
                    $skipped++
                }
                else {
                    $lineInfo = [System.Xml.IXmlLineInfo]$xmlReader
                    $insertAt = Get-AbsoluteIndex -LineStarts $lineStarts -LineNumber $lineInfo.LineNumber -LinePosition $lineInfo.LinePosition

                    if ($insertAt -ge 0) {
                        $insertions.Add([pscustomobject]@{
                            Index = $insertAt
                            Prefix = "[" + $currentAssertId + "]-"
                        })
                        $modified++
                    }
                }

                $pendingAssertCheck = $false
                continue
            }

            if ($xmlReader.NodeType -eq [System.Xml.XmlNodeType]::EndElement -and
                $xmlReader.LocalName -eq "assert" -and
                $xmlReader.NamespaceURI -eq $schematronNs) {

                if ($pendingAssertCheck) {
                    # No text node found inside assert; insert before end tag.
                    $lineInfo = [System.Xml.IXmlLineInfo]$xmlReader
                    $insertAt = Get-AbsoluteIndex -LineStarts $lineStarts -LineNumber $lineInfo.LineNumber -LinePosition $lineInfo.LinePosition

                    if ($insertAt -ge 0) {
                        $insertions.Add([pscustomobject]@{
                            Index = $insertAt
                            Prefix = "[" + $currentAssertId + "]-"
                        })
                        $modified++
                    }
                }

                $insideAssert = $false
                $pendingAssertCheck = $false
                $currentAssertId = $null
            }
        }
    }
    finally {
        $xmlReader.Dispose()
        $stringReader.Dispose()
    }

    if ($insertions.Count -gt 0) {
        $builder = [System.Text.StringBuilder]::new($content)
        $orderedInsertions = $insertions | Sort-Object Index -Descending

        foreach ($insertion in $orderedInsertions) {
            [void]$builder.Insert($insertion.Index, $insertion.Prefix)
        }

        [System.IO.File]::WriteAllText($resolvedPath, $builder.ToString(), $encoding)
    }

    Write-Host "  Modified: $modified asserts"
    Write-Host "  Skipped (already had ID): $skipped asserts"
    
    $totalModified += $modified
    $totalSkipped += $skipped
}

Write-Host "`nTotal processing complete."
Write-Host "  Total modified: $totalModified asserts"
Write-Host "  Total skipped: $totalSkipped asserts"
