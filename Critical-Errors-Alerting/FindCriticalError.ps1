## Critical Errors Alerting based on error pattern matching

# Define the path to your log file
$logFilePath = "Log-File-Path"

# Define the path to your error list file
$errorListPath = "Error-List-File-Path"  ## it should be reside in logic monitor "Pre-defined error list"

# Check if the log file exist - Example Nexus logs, today event logs
if (-not (Test-Path $logFilePath)) {
    Write-Host "Plesae check configuraiton - Log file not found: $logFilePath"
    exit 1
}

# Check if the error list file path exist
if (-not (Test-Path $errorListPath)) {
    Write-Host "Please check configuration - Error list file not found: $errorListPath"
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
            break 
        }
    }
}

# Output the result in a format that LogicMonitor can understand
Write-Host "error_count $errorCount"
