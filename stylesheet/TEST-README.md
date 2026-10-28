# Stylesheet Test Files

## Overview

This directory contains test files and tools for the Peppol BIS Invoice 3.0 HTML stylesheet (`stylesheet-ubl.xslt`).

## Files

### test-invoice-comprehensive.xml

A comprehensive test invoice that exercises all features of `stylesheet-ubl.xslt`.

### Coverage

This test file includes:

#### Document Structure
- All mandatory and optional document metadata fields
- Invoice period, order reference, contract reference
- Billing reference (preceding invoice)
- Project reference

#### Party Information (4 different party types)
1. **Supplier Party** - with full contact details
2. **Customer Party** - with full contact details
3. **Payee Party** - separate payment recipient
4. **Tax Representative Party** - for cross-border scenarios

#### Attachments (2 types)
1. Embedded binary attachment (PDF)
2. External reference (URL link)

#### Payment Methods (3 types)
1. **Credit Transfer** - with IBAN and BIC
2. **Direct Debit** - with Payment Mandate fields (BT-89, BT-91)
3. **Card Payment** - with card details

#### Delivery Information
- Delivery location with full address
- Delivery party name
- Actual delivery date

#### Allowances & Charges
- Document level allowance (discount)
- Document level charge (freight)
- Line level allowances and charges

#### Tax Categories (3 types)
- Standard rate (25%)
- Reduced rate (15%)
- Exempt (0%)

#### Invoice Lines (5 lines)
1. **Product line** - with full item details, multiple identifiers, classifications, and item properties
2. **Service line** - consulting with reduced VAT
3. **Service line** - with line allowances and charges
4. **VAT exempt line** - exported goods
5. **Negative line** - credit/return

#### Codelists Tested
- ISO3166 (country codes)
- ISO4217 (currency codes)
- UNCL4461 (payment means codes)
- UNCL5305 (duty/tax codes)
- UNCL7161 (allowance/charge reason codes)
- UNCL2005 (date/time/period qualifier)
- UNCL1153 (reference code qualifier)
- MimeCode (attachment mime types)
- UNECERec20 (unit of measure codes)
- ICD/eas (electronic address schemes)

### test-stylesheet.html

Browser-based testing tool for transforming UBL Invoice/CreditNote XML files using the compiled stylesheet with embedded SEF.

**Requirements:**
- Modern web browser with JavaScript enabled
- `SaxonJS2.rt.js` library file (place in same directory)
- `embedded-sef.js` file (generated from SEF - see below)

**Features:**
- Auto-loads embedded SEF on page load (no manual file selection needed)
- Drag-and-drop or file selection for UBL Invoice/CreditNote XML files
- Auto-transforms XML immediately after loading
- Download transformed HTML output
- Visual feedback and error reporting

**How to use:**
1. Open `test-stylesheet.html` in your browser
2. Select or drag-and-drop an invoice XML file
3. View the transformed result immediately
4. Optionally download the HTML output

## Compiling the Stylesheet

The browser-based testing tool requires the XSLT stylesheet to be compiled to SEF (Saxon Executable Format) and then embedded as JavaScript.

### Prerequisites

Install xslt3 (Node.js Saxon compiler):
```powershell
npm install -g xslt3
```

### Step 1: Compile XSLT to SEF

From the stylesheet directory:
```powershell
xslt3 -t -xsl:stylesheet-ubl.xslt -export:stylesheet-ubl.sef.json -nogo
```

This generates `stylesheet-ubl.sef.json`.

### Step 2: Embed SEF as JavaScript

From the stylesheet directory:
```powershell
node -e "const fs = require('fs'); const sef = fs.readFileSync('stylesheet-ubl.sef.json', 'utf8'); fs.writeFileSync('embedded-sef.js', 'const EMBEDDED_SEF = ' + sef + ';');"
```

This generates `embedded-sef.js` which is automatically loaded by `test-stylesheet.html`.

### How to Test

#### Option 1: Browser Testing (Recommended)

1. Compile the stylesheet to SEF format (Step 1 above)
2. Generate embedded-sef.js (Step 2 above)
3. Open `test-stylesheet.html` in your browser
4. The SEF loads automatically on page load
5. Select or drop `test-invoice-comprehensive.xml` or any UBL invoice
6. View the transformation result immediately

#### Option 2: Command-Line Testing

Transform using Saxon command-line processor (XSLT 2.0):

```powershell
# Using Saxon-HE (Java)
java -jar saxon.jar -s:test-invoice-comprehensive.xml -xsl:stylesheet-ubl.xslt -o:test-output.html

# Using xslt3 (Node.js)
xslt3 -s:test-invoice-comprehensive.xml -xsl:stylesheet-ubl.xslt -o:test-output.html
```

### Expected Output

The HTML output should display:
- All party information in readable format
- Payment information including mandate details
- Attachments section with download/view links
- Delivery information
- Complete tax breakdown
- All invoice lines with details
- Totals section with all amounts

### Language

All labels are in English only.
