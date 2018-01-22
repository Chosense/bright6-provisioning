<#
.Synopsis
Attempts to find a field with the given name and returns it. Returns
$null if no field is found.

.Parameter Context
Required. The context to use to find the field with.

.Parameter FieldName
Required. The internal name or title of the field to return.
#>

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
