#Get the cluster name
$clusterName = Get-Cluster | Select-Object -ExpandProperty Name

# Get first four leter of cluster name as role name is aligned with it 
$clusterNamePrefix = $clusterName.Substring(0, 4)
Write-Host "$clusterNamePrefix"

# Get all cluster groups (roles)
$clusterGroups = Get-ClusterGroup | Where-Object { $_.Name -like "*$clusterNamePrefix*" }
write-host "$clusterGroups"

# Get the owner nodes of all groups
$ownerNodes = $clusterGroups | Select-Object -ExpandProperty OwnerNode | Select-Object -ExpandProperty Name
Write-Host "$ownerNodes"

# Get the unique nodes from the list of owner nodes
$uniqueNodes = $ownerNodes | Sort-Object | Get-Unique

# Check if all roles are running on a single node
if ($uniqueNodes.Count -eq 1) {
    Write-Output "All cluster roles are running on a single node: $($uniqueNodes)"
} else {
    Write-Output "Cluster roles are distributed across multiple nodes."
    }
}
