Get-CIMInstance -Class Win32_Service | Select DisplayName, PathName | Export-CSV -Path C:\$env:Computername.csv


Get-CIMInstance -Class Win32_Service | Select-Object Name, DisplayName, Description, StartMode, DelayedAutoStart, StartName, PathName, State, ProcessId | Export-CSV -Path C:\$env:Computername.csv

Get-CIMInstance -ComputerName servername -Class Win32_Service | Select DisplayName, PathName | Export-CSV -Path C:\$env:Computername.csv



