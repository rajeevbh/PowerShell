# Anatomy of a command

Get-Service                             # List of all services of machine

Get-Service | Measure-Object            # Count of number of servics of machine 

Get-Service -Name WinRM                 # It displays WinRM service status and details

Get-Service -Name WinRM -ComputerName R866905-W10 # It displays WinRM service status and details of given machine 

Get-Service -Name WinRM -ComputerName R866905-W10 -RequiredServices

Get-Service -Name WinRM -ComputerName R866905-W10 -DependentServices