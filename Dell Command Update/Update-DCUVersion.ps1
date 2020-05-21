$addremovelist = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\windows\CurrentVersion\Uninstall
$dellCommand = $addremovelist | ForEach-Object {Get-ItemProperty $_.PSPath} | Where-Object DisplayName -like "Dell Command*"
if ($dellCommand){
    $dellCommandVersion = [version]$dellCommand.DisplayVersion
    if (($dellCommandVersion.Major -eq 3) -and ($dellCommandVersion.minor -lt 1)){
        return "Need to update!  Running $dellCommandVersion"
    }
    if (($dellCommandVersion.Major -eq 3) -and ($dellCommandVersion.Minor -eq 1)){
        return "Already running $dellcommandversion.  Setting custom options."
    }
}
else {
    return "Dell Command Update not found!"
}
