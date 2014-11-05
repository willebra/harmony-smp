<?xml version="1.0" encoding="UTF-8"?>
<!--

    Version: MPL 1.1/EUPL 1.1

    The contents of this file are subject to the Mozilla Public License Version
    1.1 (the "License"); you may not use this file except in compliance with
    the License. You may obtain a copy of the License at:
    http://www.mozilla.org/MPL/

    Software distributed under the License is distributed on an "AS IS" basis,
    WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
    for the specific language governing rights and limitations under the
    License.

    The Original Code is Copyright The PEPPOL project (http://www.peppol.eu)

    Alternatively, the contents of this file may be used under the
    terms of the EUPL, Version 1.1 or - as soon they will be approved
    by the European Commission - subsequent versions of the EUPL
    (the "Licence"); You may not use this work except in compliance
    with the Licence.
    You may obtain a copy of the Licence at:
    http://joinup.ec.europa.eu/software/page/eupl/licence-eupl

    Unless required by applicable law or agreed to in writing, software
    distributed under the Licence is distributed on an "AS IS" basis,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the Licence for the specific language governing permissions and
    limitations under the Licence.

    If you wish to allow use of your version of this file only
    under the terms of the EUPL License and not to allow others to use
    your version of this file under the MPL, indicate your decision by
    deleting the provisions above and replace them with the notice and
    other provisions required by the EUPL License. If you do not delete
    the provisions above, a recipient may use your version of this file
    under either the MPL or the EUPL License.

-->
<!--This file is generated automatically! Do NOT edit!-->
<!--Schematron tests for binding UBL and transaction T01-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T01" id="UBL-T01">
  <param name="BIICORE-T01-R000" value="contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')" />
  <param name="BIICORE-T01-R001" value="not(count(//*[not(text())]) > 0)" />
  <param name="BIICORE-T01-R002" value="(not(cbc:SalesOrderID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R003" value="(not(cbc:CopyIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R004" value="(not(cbc:UUID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R005" value="(not(cbc:RequestedInvoiceCurrencyCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R006" value="(not(cbc:PricingCurrencyCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R007" value="(not(cbc:TaxCurrencyCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R008" value="(not(cbc:CustomerReference) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R009" value="(not(cbc:AccountingCostCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R010" value="(not(cbc:LineCountNumeric) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R011" value="(not(cac:ValidityPeriod/cbc:StartDate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R012" value="(not(cac:ValidityPeriod/cbc:StartTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R013" value="(not(cac:ValidityPeriod/cbc:EndTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R014" value="(not(cac:ValidityPeriod/cbc:DurationMeasure) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R015" value="(not(cac:ValidityPeriod/cbc:Description) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R016" value="(not(cac:ValidityPeriod/cbc:DescriptionCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R017" value="(not(cac:QuotationDocumentReference/cbc:CopyIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R018" value="(not(cac:QuotationDocumentReference/cbc:UUID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R019" value="(not(cac:QuotationDocumentReference/cbc:IssueDate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R020" value="(not(cac:QuotationDocumentReference/cbc:DocumentTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R021" value="(not(cac:QuotationDocumentReference/cbc:DocumentType) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R022" value="(not(cac:QuotationDocumentReference/cbc:XPath) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R023" value="(not(cac:QuotationDocumentReference/cac:Attachment) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R024" value="(not(cac:OrderDocumentReference/cbc:CopyIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R025" value="(not(cac:OrderDocumentReference/cbc:UUID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R026" value="(not(cac:OrderDocumentReference/cbc:IssueDate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R027" value="(not(cac:OrderDocumentReference/cbc:DocumentTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R028" value="(not(cac:OrderDocumentReference/cbc:DocumentType) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R029" value="(not(cac:OrderDocumentReference/cbc:XPath) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R030" value="(not(cac:OrderDocumentReference/cac:Attachment) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R031" value="(not(cac:OrderDocumentReference/cbc:CopyIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R032" value="(not(cac:OrderDocumentReference/cbc:UUID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R033" value="(not(cac:OrderDocumentReference/cbc:IssueDate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R034" value="(not(cac:OrderDocumentReference/cbc:DocumentTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R035" value="(not(cac:OrderDocumentReference/cbc:XPath) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R036" value="(not(cac:OrderDocumentReference/cac:Attachment) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R037" value="(not(cac:AdditionalDocumentReference/cbc:CopyIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R038" value="(not(cac:AdditionalDocumentReference/cbc:UUID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R039" value="(not(cac:AdditionalDocumentReference/cbc:IssueDate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R040" value="(not(cac:AdditionalDocumentReference/cbc:DocumentTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R041" value="(not(cac:AdditionalDocumentReference/cbc:XPath) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R042" value="(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R043" value="(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R044" value="(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R045" value="(not(cac:Contract/cbc:IssueDate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R046" value="(not(cac:Contract/cbc:IssueTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R047" value="(not(cac:Contract/cbc:ContractTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R048" value="(not(cac:Contract/cac:ValidityPeriod) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R049" value="(not(cac:Contract/cac:ContractDocumentReference) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R050" value="(not(cac:Signature) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R051" value="(not(cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R052" value="(not(cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R053" value="(not(cac:BuyerCustomerParty/cbc:AdditionalAccountID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R054" value="(not(cac:BuyerCustomerParty/cac:DeliveryContact/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R055" value="(not(cac:BuyerCustomerParty/cac:DeliveryContact/cbc:Note) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R056" value="(not(cac:BuyerCustomerParty/cac:DeliveryContact/cac:OtherCommunication) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R057" value="(not(cac:BuyerCustomerParty/cac:AccountingContact) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R058" value="(not(cac:BuyerCustomerParty/cac:BuyerContact) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R059" value="(not(cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R060" value="(not(cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R061" value="(not(cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R062" value="(not(cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R063" value="(not(cac:BuyerCustomerParty/cac:Party/cac:Language) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R064" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R065" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R066" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R067" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Room) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R068" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R069" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R070" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R071" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R072" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R073" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R074" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R075" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R076" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Region) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R077" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:District) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R078" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R079" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R080" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R081" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R082" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R083" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R084" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R085" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R086" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R087" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:AddressTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R088" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:AddressFormatCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R089" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Postbox) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R090" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Floor) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R091" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Room) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R092" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:StreetName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R093" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:AdditionalStreetName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R094" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:BlockName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R095" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:BuildingName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R096" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:BuildingNumber) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R097" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:InhouseMail) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R098" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Department) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R099" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:MarkAttention) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R100" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:MarkCare) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R101" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:PlotIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R102" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:CitySubdivisionName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R103" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:PostalZone) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R104" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:CountrySubentity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R105" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:CountrySubentityCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R106" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Region) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R107" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:District) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R108" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:TimezoneOffset) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R109" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cac:AddressLine) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R110" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cac:Country/cbc:Name) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R111" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cac:LocationCoordinate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R112" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R113" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:AddressFormatCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R114" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Postbox) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R115" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Floor) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R116" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Room) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R117" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:StreetName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R118" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:AdditionalStreetName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R119" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:BuildingName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R120" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:BuildingNumber) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R121" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Department) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R122" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:MarkAttention) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R123" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:MarkCare) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R124" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:CityName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R125" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:PostalZone) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R126" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:CountrySubentity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R127" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:CountrySubentityCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R128" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Region) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R129" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:District) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R130" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cac:AddressLine) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R131" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R132" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R133" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R134" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R135" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R136" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R137" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R138" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R139" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R140" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R141" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R142" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R143" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R144" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R145" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R146" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R147" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R148" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R149" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R150" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R151" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R152" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R153" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R154" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R155" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R156" value="(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R157" value="(not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R158" value="(not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R159" value="(not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R160" value="(not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R161" value="(not(cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:Title) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R162" value="(not(cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:NameSuffix) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R163" value="(not(cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:OrganizationDepartment) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R164" value="(not(cac:BuyerCustomerParty/cac:Party/cac:AgentParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R165" value="(not(cac:SellerSupplierParty/cbc:CustomerAssignedAccountID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R166" value="(not(cac:SellerSupplierParty/cbc:AdditionalAccountID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R167" value="(not(cac:SellerSupplierParty/cbc:DataSendingCapability) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R168" value="(not(cac:SellerSupplierParty/cac:DespatchContact) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R169" value="(not(cac:SellerSupplierParty/cac:AccountingContact) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R170" value="(not(cac:SellerSupplierParty/cac:SellerContact) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R171" value="(not(cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R172" value="(not(cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R173" value="(not(cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R174" value="(not(cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R175" value="(not(cac:SellerSupplierParty/cac:Party/cac:Language) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R176" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R177" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R178" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R179" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R180" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R181" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R182" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R183" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R184" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R185" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R186" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R187" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R188" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R189" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R190" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R191" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R192" value="(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R193" value="(not(cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R194" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R195" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R196" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R197" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R198" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R199" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R200" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R201" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R202" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R203" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R204" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R205" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R206" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R207" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R208" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R209" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R210" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R211" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R212" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R213" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R214" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R215" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R216" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R217" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R218" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R219" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R220" value="(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R221" value="(not(cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R222" value="(not(cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R223" value="(not(cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R224" value="(not(cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R225" value="(not(cac:SellerSupplierParty/cac:Party/cac:Person/cbc:Title) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R226" value="(not(cac:SellerSupplierParty/cac:Party/cac:Person/cbc:NameSuffix) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R227" value="(not(cac:SellerSupplierParty/cac:Party/cac:Person/cbc:OrganizationDepartment) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R228" value="(not(cac:SellerSupplierParty/cac:Party/cac:AgentParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R229" value="(not(cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R230" value="(not(cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R231" value="(not(cac:OriginatorCustomerParty/cbc:AdditionalAccountID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R232" value="(not(cac:OriginatorCustomerParty/cac:DeliveryContact) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R233" value="(not(cac:OriginatorCustomerParty/cac:AccountingContact) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R234" value="(not(cac:OriginatorCustomerParty/cac:BuyerContact) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R235" value="(not(cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R236" value="(not(cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R237" value="(not(cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R238" value="(not(cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R239" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:Language) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R240" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R241" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R242" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R243" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R244" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R245" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R246" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Note) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R247" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R248" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:Person/cbc:Title) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R249" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:Person/cbc:NameSuffix) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R250" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:Person/cbc:OrganizationDepartment) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R251" value="(not(cac:OriginatorCustomerParty/cac:Party/cac:AgentParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R252" value="(not(cac:FreightForwarderParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R253" value="(not(cac:AccountingCustomerParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R254" value="(not(cac:Delivery/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R255" value="(not(cac:Delivery/cbc:Quantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R256" value="(not(cac:Delivery/cbc:MinimumQuantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R257" value="(not(cac:Delivery/cbc:MaximumQuantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R258" value="(not(cac:Delivery/cbc:ActualDeliveryTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R259" value="(not(cac:Delivery/cbc:LatestDeliveryDate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R260" value="(not(cac:Delivery/cbc:LatestDeliveryTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R261" value="(not(cac:Delivery/cbc:TrackingID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R262" value="(not(cac:Delivery/cac:DeliveryAddress) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R263" value="(not(cac:Delivery/cac:DeliveryLocation/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R264" value="(not(cac:Delivery/cac:DeliveryLocation/cbc:Description) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R265" value="(not(cac:Delivery/cac:DeliveryLocation/cbc:Conditions) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R266" value="(not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R267" value="(not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R268" value="(not(cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R269" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R270" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R271" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R272" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R273" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R274" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R275" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R276" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R277" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R278" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R279" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R280" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R281" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R282" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R283" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R284" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R285" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R286" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R287" value="(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R288" value="(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R289" value="(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R290" value="(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R291" value="(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R292" value="(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R293" value="(not(cac:Delivery/cac:PromisedDeliveryPeriod) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R294" value="(not(cac:Delivery/cac:EstimatedDeliveryPeriod) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R295" value="(not(cac:Delivery/cac:DeliveryParty/cbc:MarkCareIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R296" value="(not(cac:Delivery/cac:DeliveryParty/cbc:MarkAttentionIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R297" value="(not(cac:Delivery/cac:DeliveryParty/cbc:WebsiteURI) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R298" value="(not(cac:Delivery/cac:DeliveryParty/cbc:LogoReferenceID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R299" value="(not(cac:Delivery/cac:DeliveryParty/cac:Language) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R300" value="(not(cac:Delivery/cac:DeliveryParty/cac:PostalAddress) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R301" value="(not(cac:Delivery/cac:DeliveryParty/cac:PhysicalLocation) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R302" value="(not(cac:Delivery/cac:DeliveryParty/cac:PartyTaxScheme) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R303" value="(not(cac:Delivery/cac:DeliveryParty/cac:PartyLegalEntity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R304" value="(not(cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R306" value="(not(cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Note) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R307" value="(not(cac:Delivery/cac:DeliveryParty/cac:OtherCommunication) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R308" value="(not(cac:Delivery/cac:DeliveryParty/cac:Person) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R309" value="(not(cac:Delivery/cac:DeliveryParty/cac:AgentParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R310" value="(not(cac:Delivery/cac:Despatch) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R311" value="(not(cac:DeliveryTerms/cbc:LossRiskResponsibilityCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R312" value="(not(cac:DeliveryTerms/cbc:LossRisk) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R313" value="(not(cac:DeliveryTerms/cac:AllowanceCharge) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R314" value="(not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:Description) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R315" value="(not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:Conditions) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R316" value="(not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R317" value="(not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentityCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R318" value="(not(cac:DeliveryTerms/cac:DeliveryLocation/cac:ValidityPeriod) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R319" value="(not(cac:DeliveryTerms/cac:DeliveryLocation/cac:Address) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R320" value="(not(cac:PaymentMeans) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R321" value="(not(cac:TransactionConditions) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R322" value="(not(cac:AllowanceCharge/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R323" value="(not(cac:AllowanceCharge/cbc:AllowanceChargeReasonCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R324" value="(not(cac:AllowanceCharge/cbc:MultiplierFactorNumeric) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R325" value="(not(cac:AllowanceCharge/cbc:PrepaidIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R326" value="(not(cac:AllowanceCharge/cbc:SequenceNumeric) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R327" value="(not(cac:AllowanceCharge/cbc:BaseAmount) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R328" value="(not(cac:AllowanceCharge/cbc:AccountingCostCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R329" value="(not(cac:AllowanceCharge/cbc:AccountingCost) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R330" value="(not(cac:AllowanceCharge/cac:TaxCategory) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R331" value="(not(cac:AllowanceCharge/cac:TaxTotal) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R332" value="(not(cac:AllowanceCharge/cac:PaymentMeans) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R333" value="(not(cac:DestinationCountry) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R334" value="(not(cac:TaxTotal/cbc:RoundingAmount) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R335" value="(not(cac:TaxTotal/cbc:TaxEvidenceIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R336" value="(not(cac:TaxTotal/cac:TaxSubtotal) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R337" value="(not(cac:AnticipatedMonetaryTotal/cbc:TaxExclusiveAmount) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R338" value="(not(cac:AnticipatedMonetaryTotal/cbc:TaxInclusiveAmount) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R339" value="(not(cac:AnticipatedMonetaryTotal/cbc:PrepaidAmount) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R340" value="(not(cac:AnticipatedMonetaryTotal/cbc:PayableRoundingAmount) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R341" value="(not(cac:OrderLine/cbc:SubstitutionStatusCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R342" value="(not(cac:OrderLine/cac:SellerProposedSubstituteLineItem) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R343" value="(not(cac:OrderLine/cac:SellerSubstitutedLineItem) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R344" value="(not(cac:OrderLine/cac:BuyerProposedSubstituteLineItem) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R345" value="(not(cac:OrderLine/cac:CatalogueLineReference) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R346" value="(not(cac:OrderLine/cac:QuotationLineReference) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R347" value="(not(cac:OrderLine/cac:DocumentReference) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R348" value="(not(cac:OrderLine/cac:LineItem/cbc:SalesOrderID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R349" value="(not(cac:OrderLine/cac:LineItem/cbc:Note) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R350" value="(not(cac:OrderLine/cac:LineItem/cbc:UUID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R351" value="(not(cac:OrderLine/cac:LineItem/cbc:LineStatusCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R352" value="(not(cac:OrderLine/cac:LineItem/cbc:MinimumQuantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R353" value="(not(cac:OrderLine/cac:LineItem/cbc:MaximumQuantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R354" value="(not(cac:OrderLine/cac:LineItem/cbc:MinimumBackorderQuantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R355" value="(not(cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R356" value="(not(cac:OrderLine/cac:LineItem/cbc:InspectionMethodCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R357" value="(not(cac:OrderLine/cac:LineItem/cbc:BackOrderAllowedIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R358" value="(not(cac:OrderLine/cac:LineItem/cbc:AccountingCostCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R359" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R360" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R361" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MinimumQuantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R362" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MaximumQuantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R363" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R364" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryDate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R365" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R366" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:TrackingID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R367" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryAddress) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R368" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryLocation) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R369" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R370" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R371" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R372" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R373" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R374" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R375" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:EstimatedDeliveryPeriod) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R376" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R377" value="(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:Despatch) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R378" value="(not(cac:OrderLine/cac:LineItem/cac:DeliveryTerms) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R379" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:MarkCareIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R380" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:MarkAttentionIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R381" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:WebsiteURI) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R382" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:LogoReferenceID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R383" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:EndpointID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R384" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:Language) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R385" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PostalAddress) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R386" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PhysicalLocation) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R387" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PartyTaxScheme) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R388" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PartyLegalEntity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R389" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:Contact) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R390" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:Person) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R391" value="(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:AgentParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R392" value="(not(cac:OrderLine/cac:LineItem/cac:OrderedShipment) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R393" value="(not(cac:OrderLine/cac:LineItem/cac:PricingReference) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R394" value="(not(cac:OrderLine/cac:LineItem/cac:AllowanceCharge) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R395" value="(not(cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceChangeReason) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R396" value="(not(cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceTypeCode) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R397" value="(not(cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R398" value="(not(cac:OrderLine/cac:LineItem/cac:Price/cbc:OrderableUnitFactorRate) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R399" value="(not(cac:OrderLine/cac:LineItem/cac:Price/cac:ValidityPeriod) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R400" value="(not(cac:OrderLine/cac:LineItem/cac:Price/cac:PriceList) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R401" value="(not(cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R402" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:PackQuantity) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R403" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:PackSizeNumeric) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R404" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:CatalogueIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R405" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:HazardousRiskIndicator) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R406" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:AdditionalInformation) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R407" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:Keyword) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R408" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:BrandName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R409" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:ModelName) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R410" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R411" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:PhysycalAttribute) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R412" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:MeasurementDimension) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R413" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:IssuerParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R414" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R415" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:PhysycalAttribute) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R416" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:MeasurementDimension) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R417" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:IssuerParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R418" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R419" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R420" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturersItemIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R421" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueItemIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R422" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemIdentification) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R423" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueDocumentReference) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R424" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R425" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R426" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R427" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:HazardousItem) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R428" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturerParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R429" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:InformationContentProviderParty) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R430" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:OriginAddress) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R431" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ItemInstance) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R432" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R433" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R434" value="(not(cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R435" value="(count(cac:PartyIdentification)&lt;=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="BIICORE-T01-R436" value="(count(cac:PartyName)=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="BIICORE-T01-R437" value="(count(cac:PartyLegalEntity)&lt;=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="BIICORE-T01-R438" value="(count(cac:PartyIdentification)&lt;=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="BIICORE-T01-R439" value="(count(cac:PartyName)=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="BIICORE-T01-R440" value="(count(cac:PartyLegalEntity)&lt;=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="BIICORE-T01-R441" value="(count(cbc:Description)&lt;=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="BIICORE-T01-R442" value="(count(cac:PartyIdentification)&lt;=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="BIICORE-T01-R443" value="(count(cac:PartyName)&lt;=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="BIICORE-T01-R444" value="(count(cbc:Note)&lt;=1 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R445" value="(count(cac:ValidityPeriod)&lt;=1 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R446" value="(count(cac:OrderDocumentReference)&lt;=1 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R447" value="(count(cac:Contract)&lt;=1 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R448" value="(count(cac:Delivery)&lt;=1 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="BIICORE-T01-R449" value="(count(cac:PartyName)&lt;=1 and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="Order" value="/ubl:Order" />
  <param name="Customer" value="/ubl:Order/cac:BuyerCustomerParty/cac:Party" />
  <param name="Supplier" value="/ubl:Order/cac:SellerSupplierParty/cac:Party" />
  <param name="OrderLine" value="/ubl:Order/cac:OrderLine" />
  <param name="Item" value="/ubl:Order/cac:OrderLine/cac:LineItem/cac:Item" />
  <param name="Monetary_Total" value="/ubl:Order/cac:AnticipatedLegalMonetaryTotal" />
  <param name="Originator" value="/ubl:Order/cac:OriginatoCustomerParty" />
  <param name="Delivery_Party" value="/ubl:Order/cac:Delivery/cac:DeliveryParty" />
</pattern>
