# Define the cluster name
$clusterName = "TestCluster"

# Get all cluster groups (roles)
$clusterGroups = Get-ClusterGroup -Cluster $clusterName

# Initialize a hash table to count roles per node
$nodeRoleCount = @{}

# Iterate through each cluster group to check which node it's running on
foreach ($group in $clusterGroups) {
    $ownerNode = $group.OwnerNode.Name
    if ($nodeRoleCount.ContainsKey($ownerNode)) {
        $nodeRoleCount[$ownerNode] += 1
    } else {
        $nodeRoleCount[$ownerNode] = 1
    }
}

# Find the node with the maximum number of roles
$maxRolesNode = $nodeRoleCount.GetEnumerator() | Sort-Object -Property Value -Descending | Select-Object -First 1

# Output the result
if ($maxRolesNode.Value -eq $clusterGroups.Count) {
    Write-Output "All cluster roles are running on a single node: $($maxRolesNode.Key)"
} else {
    Write-Output "Cluster roles are distributed across multiple nodes."
    Write-Output "Roles per node:"
    $nodeRoleCount.GetEnumerator() | Sort-Object -Property Name | ForEach-Object {
        Write-Output "$($_.Name): $($_.Value)"
    }
}
