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

Add-Type -Path ".\csom\Microsoft.SharePoint.Client.dll"
Add-Type -Path ".\csom\Microsoft.SharePoint.Client.Runtime.dll"

if($ID -eq $null) {
    $ID = New-Guid
}

if([System.String]::IsNullOrEmpty($DisplayName)) {
    $DisplayName = $InternalName
}

[Microsoft.SharePoint.Client.Field]$fld = .\Get-Field.ps1 -Context $Context -FieldName $InternalName

if($fld -eq $null) {
    $xml = New-Object System.Xml.XmlDocument
    $xml.LoadXml("<Field />")
    $elem = $xml.DocumentElement
    $elem.SetAttribute("ID", "{$ID}")
    $elem.SetAttribute("Name", $InternalName)
    $elem.SetAttribute("StaticName", $InternalName)
    $elem.SetAttribute("DisplayName", $DisplayName)
    $elem.SetAttribute("Group", $Group)
    $elem.SetAttribute("Type", "Text")
    $elem.SetAttribute("MaxLength", $MaxLength)

    $fld = .\Create-XmlField.ps1 -Context $Context -Xml $xml.OuterXml
}
else {
    $fld.Group = $Group
    $fld.Title = $DisplayName

    $fld.UpdateAndPushChanges($true)
    $Context.ExecuteQuery()
}

$fld
