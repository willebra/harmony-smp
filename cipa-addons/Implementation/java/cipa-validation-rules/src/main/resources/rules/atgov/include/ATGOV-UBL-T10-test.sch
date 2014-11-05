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
<!--Schematron tests for binding UBL and transaction T10-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T10" id="UBL-T10">
  <param name="ATGOV-T10-R001" value="((cac:Contact/cbc:ElectronicMail) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R002" value="(count(//cac:InvoiceLine) &lt; 999 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R003" value="((cac:OrderReference/cbc:ID) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R004" value="(cbc:SettlementDiscountPercent and cac:SettlementPeriod and $Prerequisite2) or not ($Prerequisite2)" />
  <param name="ATGOV-T10-R005" value="(count(//cac:PayeeFinancialAccount/cbc:ID) = 1 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R006" value="((//cbc:AccountingCost) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R007" value="(cbc:PaymentMeansCode = '31' and  (cac:PayeeFinancialAccount/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and  (cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID = 'BIC') and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R008" value="((cac:OrderReferenceLine/cbc:LineID) and $Prerequisite3) or not ($Prerequisite3)" />
  <param name="ATGOV-T10-R009" value="(count(//cac:PaymentTerms/cac:SettlementPeriod) &lt;= 2 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R010" value="(number(cbc:SettlementDiscountPercent) > 0 and number(cbc:SettlementDiscountPercent) &lt; 100 and $Prerequisite4) or not ($Prerequisite4)" />
  <param name="ATGOV-T10-R011" value="(count(cac:Attachment/cac:ExternalReference) = 0 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R012" value="(cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.ms-excel' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/pdf' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'image/png' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/xml' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'text/xml' and $Prerequisite5) or not ($Prerequisite5)" />
  <param name="ATGOV-T10-R013" value="(count(//cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject) &lt;= 200 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R014" value="(string-length(string-join(//cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject/text(),'')) * 3 div 4 &lt;= 15728640 and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R015" value="((cbc:LineExtensionAmount/text() >= -999999999999.99 and cbc:LineExtensionAmount/text() &lt;= 999999999999.99) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="ATGOV-T10-R016" value="((cac:LegalMonetaryTotal/cbc:PayableAmount/text() &lt;= 999999999.99) and $Prerequisite1) or not ($Prerequisite1)" />
  <param name="Invoice" value="/ubl:Invoice" />
  <param name="Payment_Means" value="/ubl:Invoice/cac:PaymentMeans" />
  <param name="Supplier" value="/ubl:Invoice/cac:AccountingSupplierParty/cac:Party" />
  <param name="Invoice_Line" value="/ubl:Invoice/cac:InvoiceLine" />
  <param name="Payment_Terms" value="/ubl:Invoice/cac:PaymentTerms" />
  <param name="Attachments" value="/ubl:Invoice/cac:AdditionalDocumentReference" />
</pattern>
