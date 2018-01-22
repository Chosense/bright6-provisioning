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

[Microsoft.SharePoint.Client.Field]$fld = .\Get-Field.ps1 -Context $Context -FieldName $InternalName

$elem = .\Create-FieldXmlSchema.ps1 -InternalName $InternalName -DisplayName $DisplayName -Group $Group -ID $ID -Type Text
$elem.SetAttribute("MaxLength", $MaxLength)

if($fld -eq $null) {
    $fld = .\Create-XmlField.ps1 -Context $Context -Xml $elem.OuterXml
}
else {
    $fld.SchemaXml = $elem.OuterXml
    $fld.UpdateAndPushChanges($true)
    $Context.ExecuteQuery()
}

$fld
