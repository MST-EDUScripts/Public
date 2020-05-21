#This script is designed to be used with an RMA, in this case Kaseya.  It will look for an installation of
#Dell Command update and check the version number, then return a value back to the RMA.
#The RMA will then perform an action depending on the return value.

$addremovelist = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\windows\CurrentVersion\Uninstall
$dellCommand = $addremovelist | ForEach-Object {Get-ItemProperty $_.PSPath} | Where-Object DisplayName -like "Dell Command*"
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
