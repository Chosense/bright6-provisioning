<#

.Synopsis
This script provisions the required data structures for Bright 6.


.Description
The script uses the Office 365 PnP PowerShell Commandlets to provision
the required data structures to a SharePoint Online modern site. You
need the following before you can run the script.


Windows Management Framework v4.0
---------------------------------

This is a requirement for the Office 365 PnP PowerShell Commandlets.
You can install it from:
https://www.microsoft.com/en-us/download/details.aspx?id=40855



Office 365 PnP PowerShell Commandlets
-------------------------------------

The PowerShell module that this script uses for provisioning. You
install this module by running the following PowerShell command:

PS C:\>Install-Module SharePointPnPPowerShellOnline


.Example
bright6.ps1 -Url https://[yourtenant].sharepoint.com/sites/bright6

This will provision the Bright 6 structs to the SharePoint site
at the given URL.

.Example
bright6.ps1 -Url https://[yourtenant].sharepoint.com/sites/myteam

Note that you don't have to provision Bright 6 to your entire
company. You can provision Bright 6 to a site that only a selected
number employees have access to, for instance a team, the management
board, or any other group of employees that you want to have their
own and isolated instance of Bright 6 and all the data that the
instance contains.

.Parameter Url
Required. The complete URL to your SharePoint Online modern site that 
you want to provision Bright 6 to.

#>
param(
    [parameter(Mandatory=$true)]
    [string]
    $Url
)

$scripts = @{
    "content-types/company" = @(
        "columns/address"
    )
}
