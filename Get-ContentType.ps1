param(
    [parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [Microsoft.SharePoint.Client.ClientContext]
    $Context,

    [parameter(Mandatory=$true)]
    [string]
    $ID
)

Add-Type -Path ".\csom\Microsoft.SharePoint.Client.dll"
Add-Type -Path ".\csom\Microsoft.SharePoint.Client.Runtime.dll"

$ct = $Context.Web.ContentTypes.GetById($ID)
$Context.Load($ct)

Try {
    $Context.ExecuteQuery()

    if($ct.Id -ne $null) {
        $ct
    }
    else {
        $null
    }
}
Catch {
    $null
}
