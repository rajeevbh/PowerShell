Test-NetConnection -ComputerName xxxxx -Port 135

# Loop
$data = Get-Content -Path C:\DevOps\PowerShell\test.txt

<# 
$data | ForEach-Object{
    $_
}

$data | ForEach-Object{
    Write-Host "Hostname: ($_)" -BackgroundColor White -ForegroundColor Black
}
#>

$data | ForEach-Object{
    Write-Host "Sleeping for 2 seconds..." -BackgroundColor White -ForegroundColor Black
    Start-Sleep -Seconds 2
    Write-Host "Testing Host Connection: $($_)"
    "$(Get-Date): Testing Host Connection: $($_)" | Out-File hostTest.log -Append
    Test-NetConnection -ComputerName $_ -Port 443
}
