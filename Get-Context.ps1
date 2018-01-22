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