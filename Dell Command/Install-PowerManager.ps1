$download = "Dell-Power-Manager-Service_H2VH9_WIN64_3.4.0_A00_01.EXE"
$downloadURL = "https://dl.dell.com/FOLDER05695265M/3/$download"

Invoke-WebRequest -Uri $downloadURL -OutFile "$PSScriptRoot\$download"
Start-Process -FilePath "$PSScriptRoot\$download" -ArgumentList "/s" -Wait
REG IMPORT "$PSScriptRoot\PowerManagerCool.reg"
