# File path to the CSV containing server names, domains, and hierarchies
$csvFilePath = "C:\path\to\servers.csv"

# Read the list of servers from the CSV file
$servers = Import-Csv -Path $csvFilePath

# Define other parameters for AppDynamics Machine Agent
$appdynamics_download_url = "https://download.appdynamics.com/download/file/machine_agent.zip"  # Update with the actual URL
$install_path = "C:\AppDynamics\MachineAgent"
$controller_host = "your-controller-host"  # Update with your AppDynamics controller details
$controller_port = "8090"
$account_name = "your-account-name"
$access_key = "your-access-key"

# Function to download and install AppDynamics Machine Agent on each server
function Install-MachineAgent {
    param(
        [string]$serverName,
        [string]$domainName,
        [string]$serverHierarchy
    )
    
    Write-Host "Processing $serverName in $domainName under $serverHierarchy..."
    
    # Download the Machine Agent
    Invoke-Command -ComputerName $serverName -ScriptBlock {
        param ($appdynamics_download_url, $install_path)
        
        if (-Not (Test-Path $install_path)) {
            New-Item -Path $install_path -ItemType Directory
        }
        
        $zip_path = "$install_path\machine_agent.zip"
        
        Write-Host "Downloading Machine Agent on $env:COMPUTERNAME..."
        Invoke-WebRequest -Uri $appdynamics_download_url -OutFile $zip_path
        
        # Extract the ZIP file
        Write-Host "Extracting Machine Agent on $env:COMPUTERNAME..."
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::ExtractToDirectory($zip_path, $install_path)
        
        # Clean up ZIP file
        Remove-Item $zip_path -Force
    } -ArgumentList $appdynamics_download_url, $install_path

    # Configure Machine Agent properties
    Invoke-Command -ComputerName $serverName -ScriptBlock {
        param ($install_path, $controller_host, $controller_port, $account_name, $access_key)
        
        $config_file = "$install_path\conf\controller-info.xml"
        
        if (-Not (Test-Path $config_file)) {
            Write-Host "Configuration file not found. Ensure Machine Agent files are extracted correctly."
            exit 1
        }
        
        # Write controller-info.xml file for configuration
        $xml = @"
<controller-info>
    <controller-host>{$controller_host}</controller-host>
    <controller-port>{$controller_port}</controller-port>
    <account-name>{$account_name}</account-name>
    <account-access-key>{$access_key}</account-access-key>
</controller-info>
"@
        Set-Content -Path $config_file -Value $xml
        
        Write-Host "Configuration updated on $env:COMPUTERNAME..."
    } -ArgumentList $install_path, $controller_host, $controller_port, $account_name, $access_key

    # Install the Machine Agent as a Windows Service
    Invoke-Command -ComputerName $serverName -ScriptBlock {
        param ($install_path)
        
        $service_name = "AppDynamicsMachineAgent"
        $agent_path = "$install_path\bin\machine-agent.bat"
        
        Write-Host "Installing Machine Agent service on $env:COMPUTERNAME..."
        
        # Run the install command
        Start-Process -FilePath $agent_path -ArgumentList "install-service" -NoNewWindow -Wait
        
        # Start the service
        Start-Service -Name $service_name
        Write-Host "Machine Agent installed and started on $env:COMPUTERNAME."
    } -ArgumentList $install_path
}

# Loop through the servers from the CSV file and perform installation
foreach ($server in $servers) {
    Install-MachineAgent -serverName $server.ServerName -domainName $server.DomainName -serverHierarchy $server.ServerHierarchy
}
