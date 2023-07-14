
#Get-Command     # To list out all avaialle commands of powershell

Get-Command | Measure-Object    #Count of list of commands

Get-Command -Verb *Covert*

Get-Command -Verb *Convert

Get-Command -Noun *Service | Format-Table