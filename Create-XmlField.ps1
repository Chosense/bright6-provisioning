
<#
.Synopsis
Creates a new or updates an existing field from the given XML.

.Parameter Context
Required. The context that points to the site to create the field in.
Use the Get-Context.ps1 script to get the context.

.Parameter Xml
Required. An XML string that represents the field to create.

#>

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

$xmlDoc = New-Object System.Xml.XmlDocument
$xmlDoc.LoadXml($Xml)
$name = $xmlDoc.DocumentElement.GetAttribute("Name")

$fld = .\Get-Field.ps1 -Context $Context -FieldName $name
if($fld -eq $null) {
    $res = $Context.Web.Fields.AddFieldAsXml($Xml, $false, [Microsoft.SharePoint.Client.AddFieldOptions]::DefaultValue)
}
else {
    $fld.SchemaXml = $Xml
    $fld.UpdateAndPushChanges($true)
    $Context.ExecuteQuery()
}

$fld = .\Get-Field.ps1 -Context $Context -FieldName $name

$fld
