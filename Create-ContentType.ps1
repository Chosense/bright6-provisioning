<#
.Synopsis
Creates a new or updates an existing content type.

.Parameter Context
Required. The context that points to the site to create or update
the content type in.

.Parameter ID
Required. The ID of the content type. This value is used to find
an existing content type.

.Parameter Name
Optional for existing content types. Required for new content types.

.Parameter Group
Optional. The name of the group to add the content type to.

.Parameter Fields
Optional. An array containing the names of the fields to add to the
content type.

#>
param(
    [parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [Microsoft.SharePoint.Client.ClientContext]
    $Context,
    
    [parameter(Mandatory=$true)]
    [string]
    $ID,

    [parameter(Mandatory=$false)]
    [string]
    $Name,

    [parameter(Mandatory=$false)]
    [string]
    $Group,

    [parameter(Mandatory=$false)]
    [string[]]
    $Fields
)

Add-Type -Path ".\csom\Microsoft.SharePoint.Client.dll"
Add-Type -Path ".\csom\Microsoft.SharePoint.Client.Runtime.dll"

$ct = .\Get-ContentType.ps1 -Context $Context -ID $ID

Write-Host $ct

if($ct.StringId -eq $null) {
    $ctInfo = New-Object Microsoft.SharePoint.Client.ContentTypeCreationInformation
    $ctInfo.Id = $ID
    $ctInfo.Name = $Name

    if(![string]::IsNullOrEmpty($Group)) { $ctInfo.Group = $Group }
    

    $ct = $Context.Web.ContentTypes.Add($ctInfo)
    $Context.Load($ct)
    $Context.ExecuteQuery()
}
else {
    if(![string]::IsNullOrEmpty($Name)) { $ct.Name = $Name }
    if(![string]::IsNullOrEmpty($Group)) { $ct.Group = $Group }

    $ct.Update($true)
}

$ct