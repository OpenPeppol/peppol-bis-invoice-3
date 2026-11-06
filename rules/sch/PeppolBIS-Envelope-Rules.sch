<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:u="utils"
    queryBinding="xslt2"
    schemaVersion="iso">
  <title>Compliance rules for OpenPeppol Business Message Envelope (SBDH) enveloping Peppol BIS BILLING 3.0</title>
  <ns uri="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader" prefix="p1"/>
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc" />
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac" />
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" prefix="ubl-creditnote" />
  <ns uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" prefix="ubl-invoice" />
  <ns uri="http://www.w3.org/2001/XMLSchema" prefix="xs" />
  <ns uri="utils" prefix="u" />

  <!-- Functions -->
  <!-- Removes leading and trailing whitespace only. Whitespace inside a value is significant, as a space can be part of an identifier. Used for element values only; attribute values (such as schemeID) are not trimmed. -->
  <function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:trim" as="xs:string">
    <param name="val" as="xs:string?" />
    <sequence select="replace(string($val), '^\s+|\s+$', '')" />
  </function>
  <!-- Identifiers are case-insensitive. Compares the SBDH Identifier value (schemeID:value) with a Party/EndpointID, including its schemeID. Leading and trailing whitespace is trimmed from the element values, not from the schemeID attribute. -->
  <function xmlns="http://www.w3.org/1999/XSL/Transform" name="u:sameIdentifier" as="xs:boolean">
    <param name="sbdhIdentifier" as="xs:string" />
    <param name="endpoint" as="element()?" />
    <sequence select="lower-case(u:trim($sbdhIdentifier)) = lower-case(concat($endpoint/@schemeID, ':', u:trim($endpoint)))" />
  </function>


  <let name="customizationID" value="normalize-space(/p1:StandardBusinessDocument/*/cbc:CustomizationID)"/>
  <let name="profileID"       value="normalize-space(/p1:StandardBusinessDocument/*/cbc:ProfileID)"/>
  <let name="isBilling" value="
      ($customizationID = 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:billing:3.0' and
       $profileID       = 'urn:fdc:peppol.eu:2017:poacc:billing:01:1.0')
      or
      ($customizationID = 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:billing:3.0' and
       $profileID       = 'urn:peppol:bis:billing_with_response')
  "/>
  <!-- In self-billing the customer is the document issuer: Sender = customer, Receiver = supplier -->
  <let name="isSelfBilling" value="
      $customizationID = 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:selfbilling:3.0' and
      $profileID       = 'urn:fdc:peppol.eu:2017:poacc:selfbilling:01:1.0'
  "/>

  <pattern>
    <!-- Standard billing: Receiver = AccountingCustomerParty -->
    <rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Receiver/p1:Identifier[$isBilling and not($isSelfBilling)]">
      <assert id="BR-SBDH-1" test="u:sameIdentifier(., /p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID)" flag="fatal">
		[BR-SBDH-1]-When a BIS Invoice or CreditNote message is enveloped, the value of the SBDH element Receiver/Identifier SHALL match the Party/EndpointID element value of the receiver party, including the value of its schemeID attribute.
      </assert>
    </rule>
    <!-- Standard billing: Sender = AccountingSupplierParty -->
    <rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Sender/p1:Identifier[$isBilling and not($isSelfBilling)]">
      <assert id="BR-SBDH-2" test="u:sameIdentifier(., /p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID)" flag="fatal">
		[BR-SBDH-2]-When a BIS Invoice or CreditNote message is enveloped, the value of the SBDH element Sender/Identifier SHALL match the Party/EndpointID element value of the sender party, including the value of its schemeID attribute.
      </assert>
    </rule>
    <!-- Self-billing: Receiver = AccountingSupplierParty (invoice is sent to the supplier for acceptance) -->
    <rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Receiver/p1:Identifier[$isSelfBilling]">
      <assert id="BR-SBDH-3" test="u:sameIdentifier(., /p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID)" flag="fatal">
		[BR-SBDH-3]-When a self-billing Invoice or CreditNote message is enveloped, the value of the SBDH element Receiver/Identifier SHALL match the AccountingSupplierParty/Party/EndpointID element value, including the value of its schemeID attribute.
      </assert>
    </rule>
    <!-- Self-billing: Sender = AccountingCustomerParty (the customer is the issuer) -->
    <rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Sender/p1:Identifier[$isSelfBilling]">
      <assert id="BR-SBDH-4" test="u:sameIdentifier(., /p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID)" flag="fatal">
		[BR-SBDH-4]-When a self-billing Invoice or CreditNote message is enveloped, the value of the SBDH element Sender/Identifier SHALL match the AccountingCustomerParty/Party/EndpointID element value, including the value of its schemeID attribute.
      </assert>
    </rule>
  </pattern>

</schema>
