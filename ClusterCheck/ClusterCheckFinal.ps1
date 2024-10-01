# ClusterCheck.ps1 
# Version 1.0
# This script valiates the cluster availability whether all cluster roles are on single node and running

try {
    # Get the cluster name
    $clusterName = Get-Cluster | Select-Object -ExpandProperty Name

    # Get first four letters of the cluster name as the role name is aligned with it
    $clusterNamePrefix = $clusterName.Substring(0, 4)
    Write-Host "Cluster name prefix: $clusterNamePrefix"

    # Get all cluster groups (roles)
    $clusterGroups = Get-ClusterGroup | Where-Object { $_.Name -like "*$clusterNamePrefix*" }
    Write-Host "Cluster groups: $clusterGroups"

    # Get the owner nodes of all groups
    $ownerNodes = $clusterGroups | Select-Object -ExpandProperty OwnerNode | Select-Object -ExpandProperty Name
    Write-Host "Owner nodes: $ownerNodes"

    # Get the unique nodes from the list of owner nodes
    $uniqueNodes = $ownerNodes | Sort-Object | Get-Unique

    # Check if all cluster roles are running
    if ($clusterGroups.State -eq 'Online') {
        Write-Host "All cluster roles are running."
    }
    else {
        Write-Host "All cluster roles are not running."
    }

    # Check if all roles are running on a single node
    if ($uniqueNodes.Count -eq 1) {
        Write-Output "All cluster roles are running on a single node: $($uniqueNodes)"
    }
    else {
        Write-Output "Cluster roles are distributed across multiple nodes."
    }
}
catch {
    Write-Error "An error occurred: $_"
}
