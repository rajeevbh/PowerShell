# Define the cluster name
#Get-Cluster | Select-Object -ExpandProperty Name
$clusterName = "TestCluster"

# Get all cluster groups (roles)
$clusterGroups = Get-ClusterGroup -Cluster $clusterName

# Get the owner nodes of all groups
$ownerNodes = $clusterGroups | Select-Object -ExpandProperty OwnerNode | Select-Object -ExpandProperty Name

# Get the unique nodes from the list of owner nodes
$uniqueNodes = $ownerNodes | Sort-Object | Get-Unique

# Check if all roles are running on a single node
if ($uniqueNodes.Count -eq 1) {
    Write-Output "All cluster roles are running on a single node: $($uniqueNodes[0])"
} else {
    Write-Output "Cluster roles are distributed across multiple nodes."
    Write-Output "Roles per node:"
    $ownerNodes | Group-Object | ForEach-Object {
        Write-Output "$($_.Name): $($_.Count)"
    }
}

