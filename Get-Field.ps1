[OutputType("Microsoft.SharePoint.Client.Field")]

param(
    [parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [Microsoft.SharePoint.Client.ClientContext]
    $Context,

    [parameter(Mandatory=$true)]
    [string]
    $FieldName
)

Add-Type -Path ".\csom\Microsoft.SharePoint.Client.dll"
Add-Type -Path ".\csom\Microsoft.SharePoint.Client.Runtime.dll"

$found = $true
$fld = $cc.Web.Fields.GetByInternalNameOrTitle($FieldName)
$cc.Load($fld)

Try {
    $cc.ExecuteQuery()
}
Catch { $found = $false }

if($found) {
    $fld
}
else {
    $null
}
