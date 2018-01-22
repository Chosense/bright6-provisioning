<#

.Synopsis
This script provisions the required data structures for Bright 6.


.Description



.Example

.Example

.Parameter Context
The context to use to apply the Bright 6 data structures to.

#>
param(
    [parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [Microsoft.SharePoint.Client.ClientContext]
    $Context
)

Add-Type -Path ".\csom\Microsoft.SharePoint.Client.dll"
Add-Type -Path ".\csom\Microsoft.SharePoint.Client.Runtime.dll"

$fieldGrp = "Bright 6 Columns"

$fld = .\Create-MultilineTextField.ps1 -Context $Context -InternalName b6address -DisplayName "Address" -Group $fieldGrp -ID "f408e1de-f153-45e9-b039-b7260e9b8a5f" -Rows 3 -IsHtml
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6zipcode -DisplayName "Zip Code" -Group $fieldGrp -ID "379f5c24-bae9-4aac-bd5b-f9841a64e42d" -MaxLength 10
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6city -DisplayName "City" -Group $fieldGrp -ID "c998163a-3984-47b3-9d5f-1544dd7d2c6f" -MaxLength 30
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6countrycode -DisplayName "Country Code" -Group $fieldGrp -ID "f7a28219-9e38-482f-9f03-24ebc6e1cd50" -MaxLength 2
$fld = .\Create-HyperlinkField.ps1 -Context $Context -InternalName b6website -DisplayName "Website" -Group $fieldGrp -ID "22ca7318-470a-4030-a319-734b5830c002"
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6businessid -DisplayName "Business ID" -Group $fieldGrp -ID "98b11dcf-1e56-43aa-af82-540985ad06ca" -MaxLength 20
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6email -DisplayName "Email" -Group $fieldGrp -ID "fe6d3fa2-163b-4ec4-a57c-3c7b4d8df3d6" -MaxLength 100
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6phone -DisplayName "Phone" -Group $fieldGrp -ID "d4a988de-4a95-45a6-ae6c-8ac685fe20e7" -MaxLength 30
$fld = .\Create-MultilineTextField.ps1 -Context $Context -InternalName b6description -DisplayName "Description" -Group $fieldGrp -ID "4134dd9b-60ea-4333-9f12-30f2d1d08506" -Rows 6 -IsHtml
$fld = .\Create-MultilineTextField.ps1 -Context $Context -InternalName b6invoicingaddress -DisplayName "Invoicing Address" -Group $fieldGrp -ID "b618d91a-3395-4841-8e77-1fb94b0db98d" -Rows 3 -IsHtml
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6invoicingzipcode -DisplayName "Invoicing Zip Code" -Group $fieldGrp -ID "56189158-0e6a-4194-9b07-23dd654a788c" -MaxLength 10
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6invoicingcity -DisplayName "Invoicing City" -Group $fieldGrp -ID "cd60423d-372e-4ce5-8ab5-0aab2b0b7fd1" -MaxLength 30
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6invoicingcountrycode -DisplayName "Invoicing Country Code" -Group $fieldGrp -ID "e73e6163-80e8-4c6d-a7b3-ddc52e04dd04" -MaxLength 2
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6invoicingemail -DisplayName "Invoicing Email" -Group $fieldGrp -ID "70dad332-20ba-4a67-9311-1b4b38e41fdd" -MaxLength 100
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6einvoicingaddress -DisplayName "eInvoicing Address" -Group $fieldGrp -ID "8c4827c0-5403-47ed-9d84-45b056ae0301" -MaxLength 48
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6einvoicingserviceprovider -DisplayName "eInvoicing Service Provider" -Group $fieldGrp -ID "eec647e2-9b3d-4056-b968-edd80be31b31" -MaxLength 24
$fld = .\Create-PersonField.ps1 -Context $Context -InternalName b6primaryowner -DisplayName "Primary Owner" -Group $fieldGrp -ID "241e400d-4428-4185-8479-aa49aadd4c94"
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6code -DisplayName "Code" -Group $fieldGrp -ID "1a43ebce-55b1-4d1d-ae1d-8035cc53fd4f" -MaxLength 16
$fld = .\Create-NumberField.ps1 -Context $Context -InternalName b6paymentterms -DisplayName "Payment Terms" -Group $fieldGrp -ID "ca7219e8-0040-46b3-8aa3-97fceb501c61"
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6firstname -DisplayName "First Name" -Group $fieldGrp -ID "d8252f49-c2ec-4dd8-87f8-81b698fc3753" -MaxLength 50
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6lastname -DisplayName "Last Name" -Group $fieldGrp -ID "7e8156e4-46b9-4728-9279-2d378157c791" -MaxLength 50
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6mobilephone -DisplayName "Mobile Phone" -Group $fieldGrp -ID "de751e61-cae5-4c39-97ee-8f1714682709" -MaxLength 50
$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6worktitle -DisplayName "Work Title" -Group $fieldGrp -ID "24821441-8b5d-4854-a1d3-f3641cf18905" -MaxLength 100

