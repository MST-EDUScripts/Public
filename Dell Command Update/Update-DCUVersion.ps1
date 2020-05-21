$addremovelist = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\windows\CurrentVersion\Uninstall
$dellCommand = $addremovelist | ForEach-Object {Get-ItemProperty $_.PSPath} | Where-Object DisplayName -like "Dell Command*"
if ($dellCommand){
    return $dellCommand.DisplayVersion
}
else {
    return "Dell Command Update not found!"
}
