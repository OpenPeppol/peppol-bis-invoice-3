param(
    [string]$StylesheetPath = (Join-Path $PSScriptRoot '..\stylesheet\stylesheet-ubl-sb.xslt'),
    [string]$CodelistDirectory = (Join-Path $PSScriptRoot '..\structure\codelist')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$xslNamespace = 'http://www.w3.org/1999/XSL/Transform'
$codeListNamespace = 'urn:fdc:difi.no:2017:vefa:structure:CodeList-1'

function Resolve-NormalizedPath {
    param([string]$Path)

    return (Resolve-Path -Path $Path -ErrorAction Stop).Path
}

function Get-FileEncoding {
    param([string]$Path)

    $bytes = [System.IO.File]::ReadAllBytes($Path)

    if ($bytes.Length -ge 4) {
        if ($bytes[0] -eq 0x00 -and $bytes[1] -eq 0x00 -and $bytes[2] -eq 0xFE -and $bytes[3] -eq 0xFF) {
            return [System.Text.UTF32Encoding]::new($true, $true)
        }

        if ($bytes[0] -eq 0xFF -and $bytes[1] -eq 0xFE -and $bytes[2] -eq 0x00 -and $bytes[3] -eq 0x00) {
            return [System.Text.UTF32Encoding]::new($false, $true)
        }
    }

    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        return [System.Text.UTF8Encoding]::new($true)
    }

    if ($bytes.Length -ge 2) {
        if ($bytes[0] -eq 0xFE -and $bytes[1] -eq 0xFF) {
            return [System.Text.UnicodeEncoding]::new($true, $true)
        }

        if ($bytes[0] -eq 0xFF -and $bytes[1] -eq 0xFE) {
            return [System.Text.UnicodeEncoding]::new($false, $true)
        }
    }

    return [System.Text.UTF8Encoding]::new($false)
}

function Read-TextFile {
    param([string]$Path)

    $encoding = Get-FileEncoding -Path $Path
    $text = [System.IO.File]::ReadAllText($Path, $encoding)

    return [pscustomobject]@{
        Encoding = $encoding
        Text = $text
    }
}

function Get-NewLineSequence {
    param([string]$Text)

    if ($Text.Contains("`r`n")) {
        return "`r`n"
    }

    if ($Text.Contains("`n")) {
        return "`n"
    }

    return [Environment]::NewLine
}

function Normalize-Whitespace {
    param([string]$Text)

    if ([string]::IsNullOrWhiteSpace($Text)) {
        return ''
    }

    $parts = $Text.Trim().Split(@("`r`n", "`n", "`r", "`t", ' '), [System.StringSplitOptions]::RemoveEmptyEntries)
    return [string]::Join(' ', $parts)
}

function Load-XmlDocument {
    param([string]$Path)

    $document = [System.Xml.XmlDocument]::new()
    $document.PreserveWhitespace = $true

    $settings = [System.Xml.XmlReaderSettings]::new()
    $settings.IgnoreWhitespace = $false
    $settings.IgnoreComments = $false
    $settings.DtdProcessing = [System.Xml.DtdProcessing]::Ignore

    $reader = [System.Xml.XmlReader]::Create($Path, $settings)

    try {
        $document.Load($reader)
    }
    finally {
        $reader.Dispose()
    }

    return $document
}

function Read-CodelistEntries {
    param([string]$Path)

    $settings = [System.Xml.XmlReaderSettings]::new()
    $settings.IgnoreWhitespace = $false
    $settings.IgnoreComments = $true
    $settings.DtdProcessing = [System.Xml.DtdProcessing]::Ignore

    $entries = New-Object 'System.Collections.Generic.List[object]'
    $reader = [System.Xml.XmlReader]::Create($Path, $settings)

    try {
        while ($reader.Read()) {
            if ($reader.NodeType -ne [System.Xml.XmlNodeType]::Element) {
                continue
            }

            if ($reader.LocalName -ne 'Code' -or $reader.NamespaceURI -ne $codeListNamespace) {
                continue
            }

            $id = $null
            $name = $null
            $codeReader = $reader.ReadSubtree()

            try {
                while ($codeReader.Read()) {
                    if ($codeReader.NodeType -ne [System.Xml.XmlNodeType]::Element) {
                        continue
                    }

                    if ($codeReader.NamespaceURI -ne $codeListNamespace) {
                        continue
                    }

                    if ($codeReader.LocalName -eq 'Id') {
                        $id = Normalize-Whitespace -Text $codeReader.ReadElementContentAsString()
                        continue
                    }

                    if ($codeReader.LocalName -eq 'Name') {
                        $name = Normalize-Whitespace -Text $codeReader.ReadElementContentAsString()
                    }
                }
            }
            finally {
                $codeReader.Dispose()
            }

            if ([string]::IsNullOrWhiteSpace($id) -or [string]::IsNullOrWhiteSpace($name)) {
                throw "Code entry in '$Path' is missing an Id or Name element."
            }

            $entries.Add([pscustomobject]@{
                Id = $id
                Name = $name
            })
        }
    }
    finally {
        $reader.Dispose()
    }

    return $entries
}

function Build-CodelistsVariableNode {
    param(
        [System.Xml.XmlDocument]$Document,
        [System.Collections.IEnumerable]$Definitions,
        [string]$NewLine
    )

    $variable = $Document.CreateElement('xsl', 'variable', $xslNamespace)
    [void]$variable.SetAttribute('name', 'codelists')

    foreach ($definition in $Definitions) {
        [void]$variable.AppendChild($Document.CreateWhitespace($NewLine + "`t`t"))

        $codelist = $Document.CreateElement('cl')
        [void]$codelist.SetAttribute('id', $definition.Id)

        foreach ($entry in $definition.Entries) {
            [void]$codelist.AppendChild($Document.CreateWhitespace($NewLine + "`t`t`t"))

            $code = $Document.CreateElement('c')
            [void]$code.SetAttribute('id', $entry.Id)

            [void]$code.AppendChild($Document.CreateWhitespace($NewLine + "`t`t`t`t"))

            $translation = $Document.CreateElement('t')
            [void]$translation.SetAttribute('id', 'en')
            $translation.InnerText = $entry.Name

            [void]$code.AppendChild($translation)
            [void]$code.AppendChild($Document.CreateWhitespace($NewLine + "`t`t`t"))
            [void]$codelist.AppendChild($code)
        }

        [void]$codelist.AppendChild($Document.CreateWhitespace($NewLine + "`t`t"))
        [void]$variable.AppendChild($codelist)
    }

    [void]$variable.AppendChild($Document.CreateWhitespace($NewLine + "`t"))

    return $variable
}

function Get-ReferencedCodelistIds {
    param([string]$Text)

    $matches = [System.Text.RegularExpressions.Regex]::Matches($Text, "u:codelist\('([^']+)'")
    $ids = New-Object 'System.Collections.Generic.List[string]'
    $seen = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)

    foreach ($match in $matches) {
        $id = $match.Groups[1].Value
        if ($seen.Add($id)) {
            $ids.Add($id)
        }
    }

    return $ids
}

function Get-CodelistIdsFromVariableNode {
    param([System.Xml.XmlNode]$VariableNode)

    $ids = New-Object 'System.Collections.Generic.List[string]'

    foreach ($childNode in $VariableNode.ChildNodes) {
        if ($childNode.NodeType -ne [System.Xml.XmlNodeType]::Element) {
            continue
        }

        if ($childNode.LocalName -ne 'cl') {
            continue
        }

        $idAttribute = $childNode.Attributes.GetNamedItem('id')
        if ($null -eq $idAttribute -or [string]::IsNullOrWhiteSpace($idAttribute.Value)) {
            throw 'Encountered a codelist node without an id attribute in the stylesheet.'
        }

        $ids.Add($idAttribute.Value)
    }

    return $ids
}

function Assert-CodelistCoverage {
    param(
        [string[]]$ExpectedIds,
        [string[]]$ActualIds,
        [string]$Description
    )

    $expectedIds = @($ExpectedIds | Sort-Object -Unique)
    $actualIds = @($ActualIds | Sort-Object -Unique)
    $missingIds = @($expectedIds | Where-Object { $_ -notin $actualIds })
    $unexpectedIds = @($actualIds | Where-Object { $_ -notin $expectedIds })

    if ($missingIds.Count -eq 0 -and $unexpectedIds.Count -eq 0) {
        return
    }

    $differences = New-Object 'System.Collections.Generic.List[string]'

    if ($missingIds.Count -gt 0) {
        $differences.Add('missing: ' + ($missingIds -join ', '))
    }

    if ($unexpectedIds.Count -gt 0) {
        $differences.Add('unexpected: ' + ($unexpectedIds -join ', '))
    }

    throw ("{0} does not match the configured codelists ({1})." -f $Description, ($differences -join '; '))
}

function Get-CodelistsVariableText {
    param([System.Xml.XmlNode]$VariableNode)

    return '<xsl:variable name="codelists">' + $VariableNode.InnerXml + '</xsl:variable>'
}

$resolvedStylesheetPath = Resolve-NormalizedPath -Path $StylesheetPath
$resolvedCodelistDirectory = Resolve-NormalizedPath -Path $CodelistDirectory

$definitions = @(
    [pscustomobject]@{ Id = 'iso3166'; File = 'ISO3166-1_Alpha2.xml' }
    [pscustomobject]@{ Id = 'uncl1001invoice'; File = 'UNCL1001-sbinv.xml' }
    [pscustomobject]@{ Id = 'uncl1001-cn'; File = 'UNCL1001-sbcn.xml' }
)

$stylesheetFile = Read-TextFile -Path $resolvedStylesheetPath
$newLine = Get-NewLineSequence -Text $stylesheetFile.Text
$stylesheetDocument = Load-XmlDocument -Path $resolvedStylesheetPath
$configuredCodelistIds = @($definitions.Id)
$referencedCodelistIds = @((Get-ReferencedCodelistIds -Text $stylesheetFile.Text))

Assert-CodelistCoverage -ExpectedIds $configuredCodelistIds -ActualIds $referencedCodelistIds -Description 'Stylesheet codelist references'

$namespaceManager = [System.Xml.XmlNamespaceManager]::new($stylesheetDocument.NameTable)
$namespaceManager.AddNamespace('xsl', $xslNamespace)

$codelists = foreach ($definition in $definitions) {
    $sourcePath = Join-Path $resolvedCodelistDirectory $definition.File

    if (-not (Test-Path -Path $sourcePath -PathType Leaf)) {
        throw "Missing codelist source '$sourcePath'."
    }

    [pscustomobject]@{
        Id = $definition.Id
        Entries = Read-CodelistEntries -Path $sourcePath
    }
}

$existingVariable = $stylesheetDocument.SelectSingleNode('/xsl:stylesheet/xsl:variable[@name="codelists"]', $namespaceManager)
if ($null -eq $existingVariable) {
    throw 'Could not locate xsl:variable name="codelists" in the stylesheet.'
}

$replacementVariable = Build-CodelistsVariableNode -Document $stylesheetDocument -Definitions $codelists -NewLine $newLine
$existingVariableMatch = [System.Text.RegularExpressions.Regex]::Match(
    $stylesheetFile.Text,
    '<xsl:variable\b[^>]*\bname\s*=\s*"codelists"[^>]*>.*?</xsl:variable>',
    [System.Text.RegularExpressions.RegexOptions]::Singleline
)

if (-not $existingVariableMatch.Success) {
    throw 'Could not locate the codelists variable block in the stylesheet text.'
}

$replacementVariableText = Get-CodelistsVariableText -VariableNode $replacementVariable

$stylesheetUpdated = $false

if ($existingVariableMatch.Value -eq $replacementVariableText) {
    Write-Host 'Stylesheet codelists already match the source XML files.'
}
else {
    $updatedStylesheetText = $stylesheetFile.Text.Remove($existingVariableMatch.Index, $existingVariableMatch.Length).Insert($existingVariableMatch.Index, $replacementVariableText)
    [System.IO.File]::WriteAllText($resolvedStylesheetPath, $updatedStylesheetText, $stylesheetFile.Encoding)
    $stylesheetDocument = Load-XmlDocument -Path $resolvedStylesheetPath
    $namespaceManager = [System.Xml.XmlNamespaceManager]::new($stylesheetDocument.NameTable)
    $namespaceManager.AddNamespace('xsl', $xslNamespace)
    $stylesheetUpdated = $true

    Write-Host "Updated stylesheet codelists in '$resolvedStylesheetPath'."
    foreach ($definition in $codelists) {
        Write-Host ('  {0}: {1} entries' -f $definition.Id, $definition.Entries.Count)
    }
}

$updatedVariable = $stylesheetDocument.SelectSingleNode('/xsl:stylesheet/xsl:variable[@name="codelists"]', $namespaceManager)
$stylesheetCodelistIds = @((Get-CodelistIdsFromVariableNode -VariableNode $updatedVariable))

Assert-CodelistCoverage -ExpectedIds $configuredCodelistIds -ActualIds $stylesheetCodelistIds -Description 'Stylesheet codelist variable'

Write-Host ('Verified stylesheet codelists: {0}.' -f ($configuredCodelistIds -join ', '))