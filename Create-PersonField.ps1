<#
.Synopsis
Creates a person field.

.Parameter InternalName
Required. The internal name for the field.

.Parameter DisplayName
Optional. The display name for the field. Defaults to the internal name.

.Parameter Group
Optional. The group for the field.

.Parameter ID
Optional. The ID for the field. If not specified, an ID will be generated.

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
    $ID
)

$elem = .\Create-FieldXmlSchema.ps1 -InternalName $InternalName -DisplayName $DisplayName -Group $Group -ID $ID -Type User
$elem.SetAttribute("List", "UserInfo")
$elem.SetAttribute("ShowField", "ImnName")
$elem.SetAttribute("UserSelectionMode", "PeopleOnly")
$elem.SetAttribute("UserSelectionScope", "0")

$fld = .\Create-XmlField.ps1 -Context $Context -Xml $elem.OuterXml

$fld
