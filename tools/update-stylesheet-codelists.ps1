param(
    [string]$StylesheetPath = (Join-Path $PSScriptRoot '..\stylesheet\stylesheet-ubl.xslt'),
    [string]$CodelistDirectory = (Join-Path $PSScriptRoot '..\structure\codelist'),
    [string]$SefPath = (Join-Path $PSScriptRoot '..\stylesheet\stylesheet-ubl.sef.json'),
    [string]$EmbeddedSefPath = (Join-Path $PSScriptRoot '..\stylesheet\embedded-sef.js'),
    [string]$ViewerZipPath = (Join-Path $PSScriptRoot '..\stylesheet\stylesheet-viewer.zip'),
    [string]$SaxonJsRuntimePath = (Join-Path $PSScriptRoot '..\stylesheet\SaxonJS2.rt.js'),
    [string]$ViewerHtmlPath = (Join-Path $PSScriptRoot '..\stylesheet\test-stylesheet.html'),
    [string]$ViewerSampleXmlPath = (Join-Path $PSScriptRoot '..\stylesheet\test-invoice-comprehensive.xml')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$xslNamespace = 'http://www.w3.org/1999/XSL/Transform'
$codeListNamespace = 'urn:fdc:difi.no:2017:vefa:structure:CodeList-1'

function Resolve-NormalizedPath {
    param([string]$Path)

    return (Resolve-Path -Path $Path -ErrorAction Stop).Path
}

function Get-NormalizedPath {
    param([string]$Path)

    return [System.IO.Path]::GetFullPath($Path)
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

function Save-XmlDocument {
    param(
        [System.Xml.XmlDocument]$Document,
        [string]$Path,
        [System.Text.Encoding]$Encoding,
        [string]$NewLine
    )

    $settings = [System.Xml.XmlWriterSettings]::new()
    $settings.Encoding = $Encoding
    $settings.Indent = $false
    $settings.OmitXmlDeclaration = $false
    $settings.NewLineHandling = [System.Xml.NewLineHandling]::Replace
    $settings.NewLineChars = $NewLine

    $stream = [System.IO.File]::Create($Path)

    try {
        $writer = [System.Xml.XmlWriter]::Create($stream, $settings)

        try {
            $Document.Save($writer)
        }
        finally {
            $writer.Dispose()
        }
    }
    finally {
        $stream.Dispose()
    }
}

function Invoke-NativeCommand {
    param(
        [string]$CommandName,
        [string[]]$Arguments,
        [string]$WorkingDirectory
    )

    Push-Location -Path $WorkingDirectory

    try {
        & $CommandName @Arguments
        $exitCode = $LASTEXITCODE

        if ($exitCode -ne 0) {
            throw ("Command '{0} {1}' failed with exit code {2}." -f $CommandName, ($Arguments -join ' '), $exitCode)
        }
    }
    finally {
        Pop-Location
    }
}

function Write-EmbeddedSefFile {
    param(
        [string]$SefPath,
        [string]$EmbeddedSefPath
    )

    $sefJson = [System.IO.File]::ReadAllText($SefPath, [System.Text.UTF8Encoding]::new($false))
    $embeddedSefContent = 'const EMBEDDED_SEF = ' + $sefJson + ';' + [Environment]::NewLine
    [System.IO.File]::WriteAllText($EmbeddedSefPath, $embeddedSefContent, [System.Text.UTF8Encoding]::new($false))
}

function New-ViewerZip {
    param(
        [string]$ZipPath,
        [string[]]$FilePaths
    )

    $zipDirectory = Split-Path -Parent $ZipPath
    if (-not [string]::IsNullOrWhiteSpace($zipDirectory)) {
        [System.IO.Directory]::CreateDirectory($zipDirectory) | Out-Null
    }

    if (Test-Path -Path $ZipPath -PathType Leaf) {
        Remove-Item -Path $ZipPath -Force
    }

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::Open($ZipPath, [System.IO.Compression.ZipArchiveMode]::Create)

    try {
        foreach ($filePath in $FilePaths) {
            [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
                $archive,
                $filePath,
                [System.IO.Path]::GetFileName($filePath),
                [System.IO.Compression.CompressionLevel]::Optimal
            ) | Out-Null
        }
    }
    finally {
        $archive.Dispose()
    }
}

function Refresh-ViewerArtifacts {
    param(
        [string]$StylesheetPath,
        [string]$SefPath,
        [string]$EmbeddedSefPath,
        [string]$ViewerZipPath,
        [string]$SaxonJsRuntimePath,
        [string]$ViewerHtmlPath,
        [string]$ViewerSampleXmlPath
    )

    if ($null -eq (Get-Command xslt3 -ErrorAction SilentlyContinue)) {
        throw "Required command 'xslt3' is not available. Install it with 'npm install -g xslt3'."
    }

    $requiredViewerFiles = @($SaxonJsRuntimePath, $ViewerHtmlPath, $ViewerSampleXmlPath)
    foreach ($requiredViewerFile in $requiredViewerFiles) {
        if (-not (Test-Path -Path $requiredViewerFile -PathType Leaf)) {
            throw "Required viewer artifact '$requiredViewerFile' is missing."
        }
    }

    $stylesheetDirectory = Split-Path -Parent $StylesheetPath
    Invoke-NativeCommand -CommandName 'xslt3' -Arguments @(
        '-t',
        "-xsl:$StylesheetPath",
        "-export:$SefPath",
        '-nogo'
    ) -WorkingDirectory $stylesheetDirectory

    Write-EmbeddedSefFile -SefPath $SefPath -EmbeddedSefPath $EmbeddedSefPath
    New-ViewerZip -ZipPath $ViewerZipPath -FilePaths @(
        $EmbeddedSefPath,
        $SaxonJsRuntimePath,
        $ViewerSampleXmlPath,
        $ViewerHtmlPath
    )
}

$resolvedStylesheetPath = Resolve-NormalizedPath -Path $StylesheetPath
$resolvedCodelistDirectory = Resolve-NormalizedPath -Path $CodelistDirectory
$resolvedSefPath = Get-NormalizedPath -Path $SefPath
$resolvedEmbeddedSefPath = Get-NormalizedPath -Path $EmbeddedSefPath
$resolvedViewerZipPath = Get-NormalizedPath -Path $ViewerZipPath
$resolvedSaxonJsRuntimePath = Resolve-NormalizedPath -Path $SaxonJsRuntimePath
$resolvedViewerHtmlPath = Resolve-NormalizedPath -Path $ViewerHtmlPath
$resolvedViewerSampleXmlPath = Resolve-NormalizedPath -Path $ViewerSampleXmlPath

$definitions = @(
    [pscustomobject]@{ Id = 'iso3166'; File = 'ISO3166-1_Alpha2.xml' }
    [pscustomobject]@{ Id = 'uncl1001invoice'; File = 'UNCL1001-inv.xml' }
    [pscustomobject]@{ Id = 'uncl1001-cn'; File = 'UNCL1001-cn.xml' }
    [pscustomobject]@{ Id = 'uncl4461'; File = 'UNCL4461.xml' }
    [pscustomobject]@{ Id = 'uncl5305'; File = 'UNCL5305.xml' }
    [pscustomobject]@{ Id = 'uncl5189'; File = 'UNCL5189.xml' }
    [pscustomobject]@{ Id = 'uncl7161'; File = 'UNCL7161.xml' }
    [pscustomobject]@{ Id = 'uncl2005'; File = 'UNCL2005.xml' }
    [pscustomobject]@{ Id = 'uncl1153'; File = 'UNCL1153.xml' }
    [pscustomobject]@{ Id = 'uncl7143'; File = 'UNCL7143.xml' }
    [pscustomobject]@{ Id = 'unecerec20'; File = 'UNECERec20-11e.xml' }
)

$stylesheetFile = Read-TextFile -Path $resolvedStylesheetPath
$newLine = Get-NewLineSequence -Text $stylesheetFile.Text
$stylesheetDocument = Load-XmlDocument -Path $resolvedStylesheetPath

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
$existingVariableInnerXml = $existingVariable.InnerXml
$replacementVariableInnerXml = $replacementVariable.InnerXml

$stylesheetUpdated = $false

if ($existingVariableInnerXml -eq $replacementVariableInnerXml) {
    Write-Host 'Stylesheet codelists already match the source XML files.'
}
else {
    $existingVariable.ParentNode.ReplaceChild($replacementVariable, $existingVariable) | Out-Null
    Save-XmlDocument -Document $stylesheetDocument -Path $resolvedStylesheetPath -Encoding $stylesheetFile.Encoding -NewLine $newLine
    $stylesheetUpdated = $true

    Write-Host "Updated stylesheet codelists in '$resolvedStylesheetPath'."
    foreach ($definition in $codelists) {
        Write-Host ('  {0}: {1} entries' -f $definition.Id, $definition.Entries.Count)
    }
}

if (-not $stylesheetUpdated) {
    Write-Host 'Refreshing viewer artifacts from the current stylesheet.'
}

$viewerArtifactParameters = @{
    StylesheetPath = $resolvedStylesheetPath
    SefPath = $resolvedSefPath
    EmbeddedSefPath = $resolvedEmbeddedSefPath
    ViewerZipPath = $resolvedViewerZipPath
    SaxonJsRuntimePath = $resolvedSaxonJsRuntimePath
    ViewerHtmlPath = $resolvedViewerHtmlPath
    ViewerSampleXmlPath = $resolvedViewerSampleXmlPath
}

Refresh-ViewerArtifacts @viewerArtifactParameters

Write-Host "Generated SEF at '$resolvedSefPath'."
Write-Host "Generated embedded SEF at '$resolvedEmbeddedSefPath'."
Write-Host "Created viewer zip at '$resolvedViewerZipPath'."