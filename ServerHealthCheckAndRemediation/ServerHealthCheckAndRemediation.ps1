# Wait for 1 minute after server startup
Start-Sleep -Seconds 60

# Define a log file
$LogFile = "C:\HealthCheckLog.txt"
"Health Check Start - $(Get-Date)" | Out-File -FilePath $LogFile -Append

# Function to log messages
function LogMessage {
    param ([string]$Message)
    $Message | Out-File -FilePath $LogFile -Append
}

# Check and remediate critical services
LogMessage "Checking critical services..."
$CriticalServices = @("Service1", "Service2") # Replace with actual service names
foreach ($service in $CriticalServices) {
    $serviceStatus = Get-Service -Name $service -ErrorAction SilentlyContinue
    if ($serviceStatus -and $serviceStatus.Status -eq "Running") {
        LogMessage "Service '$service' is Running."
    } else {
        LogMessage "Service '$service' is NOT Running! Attempting to start..."
        try {
            Start-Service -Name $service -ErrorAction Stop
            LogMessage "Service '$service' started successfully."
        } catch {
            LogMessage "Failed to start service '$service': $_"
        }
    }
}

# Check and remediate cluster roles (if applicable)
LogMessage "Checking cluster roles..."
Import-Module FailoverClusters -ErrorAction SilentlyContinue
$ClusterGroups = Get-ClusterGroup -ErrorAction SilentlyContinue
if ($ClusterGroups) {
    foreach ($group in $ClusterGroups) {
        if ($group.State -ne "Online") {
            LogMessage "Cluster Role '$($group.Name)' is not online. Attempting to bring online..."
            try {
                Start-ClusterGroup -Name $group.Name -ErrorAction Stop
                LogMessage "Cluster Role '$($group.Name)' brought online successfully."
            } catch {
                LogMessage "Failed to bring Cluster Role '$($group.Name)' online: $_"
            }
        } else {
            LogMessage "Cluster Role '$($group.Name)' is online."
        }
    }
} else {
    LogMessage "No cluster groups found or FailoverClusters module is not available."
}

# Check and remediate scheduled tasks
LogMessage "Checking scheduled tasks..."
$ScheduledTasks = Get-ScheduledTask | Where-Object {$_.State -ne 'Ready'}
if ($ScheduledTasks) {
    foreach ($task in $ScheduledTasks) {
        LogMessage "Scheduled Task '$($task.TaskName)' is not ready. Attempting to restart..."
        try {
            Start-ScheduledTask -TaskName $task.TaskName -ErrorAction Stop
            LogMessage "Scheduled Task '$($task.TaskName)' restarted successfully."
        } catch {
            LogMessage "Failed to restart Scheduled Task '$($task.TaskName)': $_"
        }
    }
} else {
    LogMessage "All scheduled tasks are in Ready state."
}

# Check and remediate IIS application pools
LogMessage "Checking IIS application pools..."
Import-Module WebAdministration -ErrorAction SilentlyContinue
$AppPools = Get-ChildItem IIS:\AppPools
foreach ($appPool in $AppPools) {
    $appPoolState = (Get-WebAppPoolState -Name $appPool.Name).Value
    if ($appPoolState -ne "Started") {
        LogMessage "App Pool '$($appPool.Name)' is not started. Attempting to start..."
        try {
            Start-WebAppPool -Name $appPool.Name -ErrorAction Stop
            LogMessage "App Pool '$($appPool.Name)' started successfully."
        } catch {
            LogMessage "Failed to start App Pool '$($appPool.Name)': $_"
        }
    } else {
        LogMessage "App Pool '$($appPool.Name)' is started."
    }
}

LogMessage "Health Check Complete - $(Get-Date)"
