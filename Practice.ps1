# Script to install sosftware using powershell 

$32bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
                Select-Object DisplayName, DisplayVersion, Publisher, InstallDate


$64bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* |
                Select-Object DisplayName, DisplayVersion, Publisher, InstallDate

$all_softwares = $32bit_softwares + $64bit_softwares

