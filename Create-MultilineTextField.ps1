<#
.Synopsis
Creates a multiline text field.

.Parameter InternalName
Required. The internal name for the field.

.Parameter DisplayName
Optional. The display name for the field. Defaults to the internal name.

.Parameter Group
Optional. The group for the field.

.Parameter ID
Optional. The ID for the field. If not specified, an ID will be generated.

.Parameter Rows
Optional. The number of rows the field should have in edit mode.

.Parameter IsHtml
Optional. A switch that indicates whether the field should allow HTML content.
#>

param(
    [parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [Microsoft.SharePoint.Client.ClientContext]
    $Context,

    [parameter(Mandatory=$true)]
    [string]
    $InternalName,

    [parameter(Mandatory=$false)]
    [string]
    $DisplayName,

    [parameter(Mandatory=$false)]
    [string]
    $Group,

    [parameter(Mandatory=$false)]
    [Guid]
    $ID,

    [parameter(Mandatory=$false)]
    [int]
    $Rows = 6,

    [parameter(Mandatory=$false)]
    [switch]
    $IsHtml
)

$elem = .\Create-FieldXmlSchema.ps1 -InternalName $InternalName -DisplayName $DisplayName -Group $Group -ID $ID -Type Note
$elem.SetAttribute("NumLines", $Rows)

if($IsHtml) {
    $elem.SetAttribute("RichText", "TRUE")
    $elem.SetAttribute("RichTextMode", "FullHtml")
}

$fld = .\Create-XmlField.ps1 -Context $Context -Xml $elem.OuterXml

$fld
