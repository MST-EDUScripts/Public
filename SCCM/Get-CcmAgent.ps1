#Set EA to SilentlyContinue to avoid script exiting out when no sSiteCode is found
$ErrorActionPreference = "SilentlyContinue"

$service = (Get-Service -Name "ccmexec").Status
$sSiteCode = ($([WmiClass]"\\localhost\ROOT\ccm:SMS_Client").GetAssignedSite()).sSiteCode

<#
Script will return "Running\<SiteCode>" if ccmexec is found to be running.
Otherwise, it will return null and exit out.
#>

if ($service -eq "Running"){
    if (!($sSiteCode)){
        return $null
        exit
    }
    else {
        return "Running\$sSiteCode"
    }    
}
