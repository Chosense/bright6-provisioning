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

function reportFieldProgress($field) {
    Write-Host "Completed field '$($field.InternalName)'"
}

function reportCTProgress($contentType) {
    Write-Host "Completed content type '$($contentType.Name)'"
}

$fldGrp = "Bright 6 Columns"

$fld = .\Create-MultilineTextField.ps1 -Context $Context -InternalName b6address -DisplayName "Address" -Group $fldGrp -ID "f408e1de-f153-45e9-b039-b7260e9b8a5f" -Rows 3 -IsHtml
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6zipcode -DisplayName "Zip Code" -Group $fldGrp -ID "379f5c24-bae9-4aac-bd5b-f9841a64e42d" -MaxLength 10
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6city -DisplayName "City" -Group $fldGrp -ID "c998163a-3984-47b3-9d5f-1544dd7d2c6f" -MaxLength 30
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6countrycode -DisplayName "Country Code" -Group $fldGrp -ID "f7a28219-9e38-482f-9f03-24ebc6e1cd50" -MaxLength 2
reportFieldProgress $fld

$fld = .\Create-HyperlinkField.ps1 -Context $Context -InternalName b6website -DisplayName "Website" -Group $fldGrp -ID "22ca7318-470a-4030-a319-734b5830c002"
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6businessid -DisplayName "Business ID" -Group $fldGrp -ID "98b11dcf-1e56-43aa-af82-540985ad06ca" -MaxLength 20
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6email -DisplayName "Email" -Group $fldGrp -ID "fe6d3fa2-163b-4ec4-a57c-3c7b4d8df3d6" -MaxLength 100
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6phone -DisplayName "Phone" -Group $fldGrp -ID "d4a988de-4a95-45a6-ae6c-8ac685fe20e7" -MaxLength 30
reportFieldProgress $fld

$fld = .\Create-MultilineTextField.ps1 -Context $Context -InternalName b6description -DisplayName "Description" -Group $fldGrp -ID "4134dd9b-60ea-4333-9f12-30f2d1d08506" -Rows 6 -IsHtml
reportFieldProgress $fld

$fld = .\Create-MultilineTextField.ps1 -Context $Context -InternalName b6invoicingaddress -DisplayName "Invoicing Address" -Group $fldGrp -ID "b618d91a-3395-4841-8e77-1fb94b0db98d" -Rows 3 -IsHtml
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6invoicingzipcode -DisplayName "Invoicing Zip Code" -Group $fldGrp -ID "56189158-0e6a-4194-9b07-23dd654a788c" -MaxLength 10
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6invoicingcity -DisplayName "Invoicing City" -Group $fldGrp -ID "cd60423d-372e-4ce5-8ab5-0aab2b0b7fd1" -MaxLength 30
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6invoicingcountrycode -DisplayName "Invoicing Country Code" -Group $fldGrp -ID "e73e6163-80e8-4c6d-a7b3-ddc52e04dd04" -MaxLength 2
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6invoicingemail -DisplayName "Invoicing Email" -Group $fldGrp -ID "70dad332-20ba-4a67-9311-1b4b38e41fdd" -MaxLength 100
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6einvoicingaddress -DisplayName "eInvoicing Address" -Group $fldGrp -ID "8c4827c0-5403-47ed-9d84-45b056ae0301" -MaxLength 48
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6einvoicingserviceprovider -DisplayName "eInvoicing Service Provider" -Group $fldGrp -ID "eec647e2-9b3d-4056-b968-edd80be31b31" -MaxLength 24
reportFieldProgress $fld

$fld = .\Create-PersonField.ps1 -Context $Context -InternalName b6primaryowner -DisplayName "Primary Owner" -Group $fldGrp -ID "241e400d-4428-4185-8479-aa49aadd4c94"
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6code -DisplayName "Code" -Group $fldGrp -ID "1a43ebce-55b1-4d1d-ae1d-8035cc53fd4f" -MaxLength 16
reportFieldProgress $fld

$fld = .\Create-NumberField.ps1 -Context $Context -InternalName b6paymentterms -DisplayName "Payment Terms" -Group $fldGrp -ID "ca7219e8-0040-46b3-8aa3-97fceb501c61"
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6firstname -DisplayName "First Name" -Group $fldGrp -ID "d8252f49-c2ec-4dd8-87f8-81b698fc3753" -MaxLength 50
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6lastname -DisplayName "Last Name" -Group $fldGrp -ID "7e8156e4-46b9-4728-9279-2d378157c791" -MaxLength 50
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6mobilephone -DisplayName "Mobile Phone" -Group $fldGrp -ID "de751e61-cae5-4c39-97ee-8f1714682709" -MaxLength 50
reportFieldProgress $fld

$fld = .\Create-SinglelineTextField.ps1 -Context $Context -InternalName b6worktitle -DisplayName "Work Title" -Group $fldGrp -ID "24821441-8b5d-4854-a1d3-f3641cf18905" -MaxLength 100
reportFieldProgress $fld



$ctGrp = "Bright 6 Content Types"
$baseContentTypeId = "0x01006881F5723C3749779E7d35AE3A5151EF"
$companyId = "$($baseContentTypeId)006810AFCFA96449D1B4263FBBD39CFD0F"
$contactId = "$($baseContentTypeId)00579C6342417140AE9315E8E6D8FDE337"
$activityId = "$($baseContentTypeId)002082CE5F9C9E4C04861202d850C080A5"

$ct = .\Create-ContentType.ps1 -Context $Context -ID $baseContentTypeId -Name "B6 Base Item" -Group $ctGrp
reportCTProgress $ct

$ct = .\Create-ContentType.ps1 -Context $Context -ID $companyId -Name "B6 Company" -Group $ctGrp
reportCTProgress $ct

$ct = .\Create-ContentType.ps1 -Context $Context -ID $contactId -Name "B6 Contact" -Group $ctGrp
reportCTProgress $ct

$ct = .\Create-ContentType.ps1 -Context $Context -ID $activityId -Name "B6 Activity" -Group $ctGrp
reportCTProgress $ct

Write-Host "Done!"