## Critical Errors Alerting

# Define the path to your log file
$logFilePath = "C:\path\to\your\logfile.log"

# Define the path to your error list file
$errorListPath = "C:\path\to\errors.txt"

# Check if both the log file and error list file exist
if (-not (Test-Path $logFilePath)) {
    Write-Host "Log file not found: $logFilePath"
    exit 1
}

if (-not (Test-Path $errorListPath)) {
    Write-Host "Error list file not found: $errorListPath"
    exit 1
}

# Read the error list from the file
$errors = Get-Content -Path $errorListPath

# Initialize a counter for the number of found errors
$errorCount = 0

# Read the log file line by line
$logLines = Get-Content -Path $logFilePath
foreach ($line in $logLines) {
    foreach ($error in $errors) {
        if ($line -match $error) {
            $errorCount++
            break  # Break inner loop if an error is found to avoid double counting
        }
    }
}

# Output the result in a format that LogicMonitor can understand
Write-Host "error_count $errorCount"
