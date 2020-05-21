#This script is designed to be used with an RMA, in this case Kaseya.  It will look for an installation of
#Dell Command update and check the version number, then return a value back to the RMA.
#The RMA will then perform an action depending on the return value. You can run the script with a switch parameter
#to determine what info is being returned.

[CmdletBinding()]
param (
    [switch]$Version,
    [switch]$Uninstall
)

$addremovelist = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\windows\CurrentVersion\Uninstall
$dellCommand = $addremovelist | ForEach-Object {Get-ItemProperty $_.PSPath} | Where-Object DisplayName -like "Dell Command*"

if ($Version){
    if ($dellCommand){
        $dellCommandVersion = [version]$dellCommand.DisplayVersion
        if (($dellCommandVersion.Major -eq 3) -and ($dellCommandVersion.minor -lt 1)){
            return "Update"
        }
        if (($dellCommandVersion.Major -eq 3) -and ($dellCommandVersion.Minor -eq 1)){
            return "Customize"
        }
    }
    else {
        return "Install"
    }
}
if ($Uninstall){
    return $dellCommand.UninstallString
}
