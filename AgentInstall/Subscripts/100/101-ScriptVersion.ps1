Clear-Host
$scriptName = "101-ScriptVersion.ps1"
Write-Host $scriptName -ForegroundColor DarkMagenta -BackgroundColor Black

# Setting the script version number 
$scriptversion = "1.1"
Write-Output "Creating agent.version file."
Set-Content "$thisfolder\\installers\agent.version" -Value $scriptversion


