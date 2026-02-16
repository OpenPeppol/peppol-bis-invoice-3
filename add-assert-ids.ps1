# PowerShell script to add assert IDs to the text content of assert elements
# Only adds the ID if it doesn't already exist in the text
# Uses proper XML parsing for reliability

param(
    [string[]]$FilePaths = @(
        "rules\sch\PEPPOL-EN16931-UBL.sch",
        "rules\sch\PEPPOL-EN16931-CII.sch"
    )
)

$totalModified = 0
$totalSkipped = 0

foreach ($FilePath in $FilePaths) {
    Write-Host "`nProcessing: $FilePath"
    
    # Load the XML document
    $xml = New-Object System.Xml.XmlDocument
    $xml.PreserveWhitespace = $true
    $xml.Load((Resolve-Path $FilePath))

    # Create namespace manager for the schematron namespace
    $nsManager = New-Object System.Xml.XmlNamespaceManager($xml.NameTable)
    $nsManager.AddNamespace("sch", "http://purl.oclc.org/dsdl/schematron")

    # Find all assert elements with an id attribute
    $asserts = $xml.SelectNodes("//sch:assert[@id]", $nsManager)

    $modified = 0
    $skipped = 0

    foreach ($assert in $asserts) {
        $id = $assert.GetAttribute("id")
        $text = $assert.InnerText
        
        # Check if the text already starts with [ID]
        $pattern = "^\s*\[$([regex]::Escape($id))\]"
        
        if ($text -match $pattern) {
            # ID already present, skip
            $skipped++
        }
        else {
            # Add the ID prefix to the text
            $assert.InnerText = "[$id]-$text"
            $modified++
        }
    }

    # Save the document
    $xml.Save((Resolve-Path $FilePath))

    Write-Host "  Modified: $modified asserts"
    Write-Host "  Skipped (already had ID): $skipped asserts"
    
    $totalModified += $modified
    $totalSkipped += $skipped
}

Write-Host "`nTotal processing complete."
Write-Host "  Total modified: $totalModified asserts"
Write-Host "  Total skipped: $totalSkipped asserts"
