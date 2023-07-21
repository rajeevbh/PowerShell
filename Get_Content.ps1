# Get-Content command to used to read the content of a file

Get-Content .\test.txt # Read data from current folder

Get-Content -Path C:\DevOps\PowerShell\test.txt

$data = Get-Content -Path C:\DevOps\PowerShell\test.txt
Write-Output $data
