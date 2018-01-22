<#
.Synopsis
Creates an XmlElement object stub that can be used to create or update
a field in a site.

.Parameter InternalName
Required. The internal name for the field.

.Parameter DisplayName
Optional. The display name for the field. Defaults to the internal name.

.Parameter Group
Optional. The group for the field.

.Parameter ID
Optional. The ID for the field. If not specified, an ID will be generated.

.Parameter Type
Optional. The type of the field as a string. The default value is "Text"
#>

param(
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
    [string]
    $Type = "Text"
)


if($ID -eq $null) {
    $ID = New-Guid
}

if([System.String]::IsNullOrEmpty($DisplayName)) {
    $DisplayName = $InternalName
}


$xml = New-Object System.Xml.XmlDocument
$xml.LoadXml("<Field />")
$elem = $xml.DocumentElement
$elem.SetAttribute("ID", "{$ID}")
$elem.SetAttribute("Name", $InternalName)
$elem.SetAttribute("StaticName", $InternalName)
$elem.SetAttribute("DisplayName", $DisplayName)
$elem.SetAttribute("Group", $Group)
$elem.SetAttribute("Type", $Type)

$elem