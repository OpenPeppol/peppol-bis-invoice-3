<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2"
    schemaVersion="iso">
  <title>Compliance rules for OpenPeppol Business Message Envelope (SBDH) enveloping Peppol BIS BILLING 3.0</title>
  <ns uri="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc" />
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac" />
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" prefix="ubl-creditnote" />
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" prefix="ubl-invoice" />

  <!-- Only apply rules when the document is a Peppol BIS Billing 3.0 invoice -->
  <pattern>
    <rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Receiver/p1:Identifier[
        /p1:StandardBusinessDocument/*/cbc:ProfileID = 'urn:fdc:peppol.eu:2017:poacc:billing:01:1.0' and
        /p1:StandardBusinessDocument/*/cbc:CustomizationID = 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:billing:3.0'
      ]">
      <assert id="SBDH-BR-1" test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID))" flag="fatal">
		When a BIS message is enveloped, the value of the SBDH element Receiver/Identifier SHALL match the Party/EndpointID element value of the receiver party, including the value of its schemeID attribute.
      </assert>
    </rule>
  </pattern>
  <pattern>
    <rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Sender/p1:Identifier[
        /p1:StandardBusinessDocument/*/cbc:ProfileID = 'urn:fdc:peppol.eu:2017:poacc:billing:01:1.0' and
        /p1:StandardBusinessDocument/*/cbc:CustomizationID = 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:billing:3.0'
      ]">
      <assert id="SBDH-BR-2" test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID))" flag="fatal">
		When a BIS message is enveloped, the value of the SBDH element Sender/Identifier SHALL match the Party/EndpointID element value of the sender party, including the value of its schemeID attribute.
      </assert>
    </rule>
  </pattern>
  
</schema>
