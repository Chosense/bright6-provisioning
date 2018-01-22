<#
.Synopsis
Creates a new Microsoft.SharePoint.Client.ClientContext object and returns it.

.Parameter Url
Required. The full URL to the modern SharePoint site to return a context for.

.Parameter UserName
Required. The user name to use when logging on to the site at Url.

.Parameter Password
Required. The password for UserName.

#>
param(
    [parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string]
    $Url,

    [parameter(Mandatory=$true)]
    [string]
    $UserName,

    [parameter(Mandatory=$true)]
    [SecureString]
    $Password
)

Add-Type -Path ".\csom\Microsoft.SharePoint.Client.dll"
Add-Type -Path ".\csom\Microsoft.SharePoint.Client.Runtime.dll"

$cc = New-Object Microsoft.SharePoint.Client.ClientContext($Url)
$cc.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($UserName, $Password)

$cc