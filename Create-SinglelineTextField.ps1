<#
.Synopsis
Creates single-line text field.

.Parameter InternalName
Required. The internal name for the field.

.Parameter DisplayName
Optional. The display name for the field. Defaults to the internal name.

.Parameter Group
Optional. The group for the field.

.Parameter ID
Optional. The ID for the field. If not specified, an ID will be generated.

.Parameter MaxLength
Optional. The maximum length of the field.

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
    $MaxLength = 255
)

$elem = .\Create-FieldXmlSchema.ps1 -InternalName $InternalName -DisplayName $DisplayName -Group $Group -ID $ID -Type Text
$elem.SetAttribute("MaxLength", $MaxLength)

$fld = .\Create-XmlField.ps1 -Context $Context -Xml $elem.OuterXml

$fld
