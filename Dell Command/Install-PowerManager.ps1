$download = "Dell-Power-Manager-Service_H2VH9_WIN64_3.4.0_A00_01.EXE"
$downloadURL = "https://dl.dell.com/FOLDER05695265M/3/$download"

Invoke-WebRequest -Uri $downloadURL -OutFile "$PSScriptRoot\$download"
Start-Process -FilePath "$PSScriptRoot\$download" -ArgumentList "/s" -Wait

New-Item -Path HKLM:\SOFTWARE\Policies\Dell
New-Item -Path HKLM:\SOFTWARE\Policies\Dell\CommandPowerManager
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Dell\CommandPowerManager -Name DoNotRemove -PropertyType String -Value "Null"
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Dell\CommandPowerManager -Name TMSettingsGroup -PropertyType String -Value "True"
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Dell\CommandPowerManager -Name TMPolicyVersion -PropertyType String -Value "1.0.0"
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Dell\CommandPowerManager -Name TMMode -PropertyType DWORD -Value 2
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Dell\CommandPowerManager -Name TMModeBalanced -PropertyType DWORD -Value 0
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Dell\CommandPowerManager -Name TMModeCool -PropertyType DWORD -Value 0
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Dell\CommandPowerManager -Name TMModeQuiet -PropertyType DWORD -Value 0
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Dell\CommandPowerManager -Name TMModeUltra -PropertyType DWORD -Value 0
