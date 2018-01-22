
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
    $Type
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