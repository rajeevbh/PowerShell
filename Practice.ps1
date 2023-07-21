# Script to install sosftware using powershell 

Start-Transcript -Path "C:\DevOps\PowerShell\npp.log" -NoClobber

$installerSource = "https://notepad-plus-plus.org/downloads/v8.5.4/"
$installerDestination = "C:\DevOps\PowerShell\"
$installerLocation = "$intallerDestination\npp.exe"
$softwareName = "Notepad++ (32-bit x86)" # Software Name

# $32bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
#                Select-Object DisplayName, DisplayVersion, Publisher, InstallDate


# $64bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* |
#                Select-Object DisplayName, DisplayVersion, Publisher, InstallDate

# $all_softwares = $32bit_softwares + $64bit_softwares

$32bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*

$64bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*

$all_softwares = $32bit_softwares + $64bit_softwares

Write-Output $all_softwares | Format-Table

if (($all_softwares.DisplayName) -like $softwareName ){

    Write-Output $softwareName "is already installed"
    #Exit;
}
else {
    Write-Output $softwareName "is not installed. Proceeding with installation"
}

# Download the file at specified location 
if (-not (Test-Path $installerLocation)) {  
    <# Testing whether installer file is available #>
    New-Item $installerDestination -ItemType Directory -Force
    Invoke-WebRequest -Uri $installerSource -OutFile $installerLocation -Verbose
}

# Installing the software in the system

Write-Output "Installing software: " $softwareName
Start-Process $installerLocation /S -NoNewWindow -Wait -PassThru

if(($all_softwares.DisplayName) -like "$SoftwareName"){
    Write-Output "SOftware is installed successfully"
}

Stop-Transcript
