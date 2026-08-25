[CmdletBinding()]
param(
    [string]$OutputPath = 'target/generated/inferred-cardinality-xsd-audit.csv',
    [string]$SchematronOutputPath = 'rules/sch/inferred-mandatory-cardinality.sch'
)

$ErrorActionPreference = 'Stop'

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$xsdNamespace = 'http://www.w3.org/2001/XMLSchema'
$namespaceManager = [System.Xml.XmlNamespaceManager]::new([System.Xml.NameTable]::new())
$namespaceManager.AddNamespace('xsd', $xsdNamespace)

function Read-XmlDocument {
    param([string]$Path)

    $document = [System.Xml.XmlDocument]::new()
    $document.Load($Path)
    return $document
}

function Get-XsdElement {
    param(
        [System.Xml.XmlDocument]$Schema,
        [string]$ParentType,
        [string]$Term
    )

    $type = $Schema.SelectSingleNode("//xsd:complexType[`@name='$ParentType']", $namespaceManager)
    if (-not $type) {
        return $null
    }

    return $type.SelectSingleNode(".//xsd:sequence/xsd:element[`@ref='$Term' or `@name='$($Term.Split(':')[-1])']", $namespaceManager)
}

function Get-XsdType {
    param(
        [System.Xml.XmlElement]$Element,
        [hashtable]$Schemas
    )

    if ($Element.HasAttribute('type')) {
        return $Element.GetAttribute('type').Split(':')[-1]
    }

    if (-not $Element.HasAttribute('ref')) {
        return $null
    }

    $reference = $Element.GetAttribute('ref')
    $prefix = $reference.Split(':')[0]
    $name = $reference.Split(':')[-1]
    $globalElement = $Schemas[$prefix].SelectSingleNode("//xsd:element[`@name='$name']", $namespaceManager)
    if ($globalElement -and $globalElement.HasAttribute('type')) {
        return $globalElement.GetAttribute('type').Split(':')[-1]
    }

    return $null
}

function Get-IncludedElements {
    param([string]$IncludePath)

    $includeDocument = Read-XmlDocument $IncludePath
    if ($includeDocument.DocumentElement.LocalName -eq 'Element') {
        return @($includeDocument.DocumentElement)
    }

    return @($includeDocument.DocumentElement.SelectNodes("*[local-name()='Element']"))
}

function ConvertTo-SchematronContext {
    param(
        [string]$DocumentName,
        [string]$ElementPath
    )

    $segments = $ElementPath -split '/'
    $segments[0] = if ($DocumentName -eq 'invoice') { 'ubl-invoice:Invoice' } else { 'ubl-creditnote:CreditNote' }
    return $segments[0..($segments.Count - 2)] -join '/'
}

function Resolve-StructureElements {
    param(
        [System.Xml.XmlNode[]]$Nodes,
        [string]$DocumentName,
        [string]$Path,
        [string]$ParentCardinality,
        [string]$ParentType,
        [System.Xml.XmlDocument]$ParentSchema,
        [hashtable]$Schemas,
        [System.Collections.Generic.List[object]]$Rows
    )

    foreach ($node in $Nodes) {
        if ($node.LocalName -eq 'Include') {
            $includePath = Join-Path (Split-Path -Parent $node.BaseURI.Replace('file:///', '')) $node.InnerText.Trim()
            Resolve-StructureElements -Nodes (Get-IncludedElements $includePath) -DocumentName $DocumentName -Path $Path -ParentCardinality $ParentCardinality -ParentType $ParentType -ParentSchema $ParentSchema -Schemas $Schemas -Rows $Rows
            continue
        }

        if ($node.LocalName -ne 'Element') {
            continue
        }

        $termNode = $node.SelectSingleNode("*[local-name()='Term']")
        if (-not $termNode) {
            continue
        }

        $term = $termNode.InnerText.Trim()
        $elementPath = "$Path/$term"
        $xsdElement = Get-XsdElement -Schema $ParentSchema -ParentType $ParentType -Term $term
        $xsdCardinality = if ($xsdElement) {
            $minimum = if ($xsdElement.HasAttribute('minOccurs')) { $xsdElement.GetAttribute('minOccurs') } else { '1' }
            $maximum = if ($xsdElement.HasAttribute('maxOccurs')) { $xsdElement.GetAttribute('maxOccurs') } else { '1' }
            "$minimum..$maximum"
        } else { 'UNRESOLVED' }
        $elementType = if ($xsdElement) { Get-XsdType -Element $xsdElement -Schemas $Schemas } else { $null }
        $cardinality = if ($node.Attributes['cardinality']) { $node.Attributes['cardinality'].Value } else { '1..1' }

        if (-not $node.Attributes['cardinality']) {
            $references = @($node.SelectNodes("*[local-name()='Reference' and `@type='BUSINESS_TERM']") | ForEach-Object { $_.InnerText.Trim() }) -join ', '
            $Rows.Add([pscustomobject]@{
                Document = $DocumentName
                SourceFile = [System.IO.Path]::GetRelativePath($repositoryRoot, $node.BaseURI.Replace('file:///', ''))
                Path = $elementPath
                BusinessTerms = $references
                SyntaxExplicitCardinality = 'NO'
                SyntaxGeneratedCardinality = '1..1'
                ParentSyntaxCardinality = $ParentCardinality
                XsdCardinality = $xsdCardinality
                XsdDiffersFromGeneratedMandatory = if ($xsdCardinality -eq '1..1') { 'NO' } else { 'YES' }
            })
        }

        $childSchema = $ParentSchema
        if ($elementType -and $term.Contains(':')) {
            $prefix = $term.Split(':')[0]
            if ($Schemas.ContainsKey($prefix)) {
                $childSchema = $Schemas[$prefix]
            }
        }

        Resolve-StructureElements -Nodes @($node.ChildNodes) -DocumentName $DocumentName -Path $elementPath -ParentCardinality $cardinality -ParentType $elementType -ParentSchema $childSchema -Schemas $Schemas -Rows $Rows
    }
}

$aggregateSchema = Read-XmlDocument (Join-Path $repositoryRoot 'rules/sch/xsd/common/UBL-CommonAggregateComponents-2.5.xsd')
$basicSchema = Read-XmlDocument (Join-Path $repositoryRoot 'rules/sch/xsd/common/UBL-CommonBasicComponents-2.5.xsd')
$rows = [System.Collections.Generic.List[object]]::new()

foreach ($document in @(
    @{ Name = 'invoice'; Structure = 'structure/syntax/ubl-selfbilledinvoice.xml'; Schema = 'rules/sch/xsd/maindoc/UBL-Invoice-2.5.xsd'; Root = 'ubl:Invoice'; Type = 'InvoiceType' },
    @{ Name = 'creditnote'; Structure = 'structure/syntax/ubl-selfbilledcreditnote.xml'; Schema = 'rules/sch/xsd/maindoc/UBL-CreditNote-2.5.xsd'; Root = 'ubl:CreditNote'; Type = 'CreditNoteType' }
)) {
    $documentSchema = Read-XmlDocument (Join-Path $repositoryRoot $document.Schema)
    $schemas = @{ ubl = $documentSchema; cac = $aggregateSchema; cbc = $basicSchema }
    $structure = Read-XmlDocument (Join-Path $repositoryRoot $document.Structure)
    $root = $structure.SelectSingleNode("/*[local-name()='Structure']/*[local-name()='Document']")
    Resolve-StructureElements -Nodes @($root.ChildNodes) -DocumentName $document.Name -Path $document.Root -ParentCardinality '(root)' -ParentType $document.Type -ParentSchema $documentSchema -Schemas $schemas -Rows $rows
}

$destination = Join-Path $repositoryRoot $OutputPath
New-Item -ItemType Directory -Force -Path (Split-Path -Parent $destination) | Out-Null
$rows | Sort-Object Document, Path | Export-Csv -NoTypeInformation -Encoding utf8 -Path $destination
Write-Host "Wrote $($rows.Count) inferred-cardinality rows to $destination"

$assertionRows = @(
    $rows |
        Where-Object XsdDiffersFromGeneratedMandatory -eq 'YES' |
        Sort-Object Document, Path |
        ForEach-Object -Begin { $ruleNumber = 140 } -Process {
            $pathSegments = $_.Path -split '/'
            [pscustomobject]@{
                Context = ConvertTo-SchematronContext -DocumentName $_.Document -ElementPath $_.Path
                Child = $pathSegments[-1]
                Id = "PEPPOL-EN16931-R$ruleNumber"
            }
            $ruleNumber++
        }
)

$rules = @(
    $assertionRows |
        Group-Object Context |
        ForEach-Object {
            $context = $_.Name
            $assertions = $_.Group | ForEach-Object {
                "    <assert id=`"$($_.Id)`" test=`"count($($_.Child)) = 1`" flag=`"fatal`">[$($_.Id)]-$context MUST contain exactly one $($_.Child).</assert>"
            }
            "  <rule context=`"$context`">`n$($assertions -join "`n")`n  </rule>"
        }
)

$schematronDestination = Join-Path $repositoryRoot $SchematronOutputPath
@(
    '<?xml version="1.0" encoding="UTF-8"?>'
    '<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="inferred-mandatory-cardinality">'
    $rules
    '</pattern>'
) | Set-Content -Encoding utf8 -Path $schematronDestination
Write-Host "Wrote $($assertionRows.Count) cardinality assertions in $($rules.Count) parent-context rules to $schematronDestination"