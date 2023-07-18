# Finding command using Get-Command

#Get-Command | Format-Table    # To list out all avaialle commands of powershell

#Get-Command | Measure-Object    # Count of list of commands

Get-Command -Verb Convert* | Format-Table  # It displays commands start with Convert

#Get-Command -Noun *Service | Format-Table # It displays commands end with Service

#Get-Command -Noun *HTML* | Format-Table 

#Get-Command -Noun *XML* | Format-Table

#Get-Command -Verb *Convert* -Noun *XML* | Format-Table

#Get-Command -Name *XML* | Format-Table