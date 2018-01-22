
param(
    [parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [Microsoft.SharePoint.Client.ClientContext]
    $Context,

    [parameter(Mandatory=$true)]
    [string]
    $Xml
)

Add-Type -Path ".\csom\Microsoft.SharePoint.Client.dll"
Add-Type -Path ".\csom\Microsoft.SharePoint.Client.Runtime.dll"

$Context.Web.Fields.AddFieldAsXml($Xml, $false, [Microsoft.SharePoint.Client.AddFieldOptions]::DefaultValue)

$xmlDoc = New-Object System.Xml.XmlDocument
$xmlDoc.LoadXml($Xml)
$name = $xmlDoc.DocumentElement.GetAttribute("Name")

$fld = .\Get-Field.ps1 -Context $Context -FieldName $name

$fld
