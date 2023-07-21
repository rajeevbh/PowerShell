# This is main cordinator page

Clear-Host
$scriptName = "100-Cordinator.ps1"
Write-Host $scriptName -ForegroundColor DarkMagenta -BackgroundColor Black

$start = Get-Date

. $thisFolder\\Subscripts\100\101-ScriptVersion.ps1
. $thisFolder\\Subscripts\100\102-Banner.ps1
. $thisFolder\\Subscripts\100\103-GoalMenu.ps1

$end = Get-Date
$elapsedTime = $end - $start
$elapsedTimeInMinutes = [math]::Round($elapsedTime.TotalMinutes,2)
Write-Output "Total Script Duration: $elapsedTimeInMinutes minutes"