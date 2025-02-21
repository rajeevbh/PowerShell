# PowerShell Conditional Statements

| Statement  | Description | Example |
|------------|-------------|---------|
| `if`  | Executes code block if the condition is true | `if ($x -gt 10) { Write-Host "Greater" }` |
| `if-else`  | Executes one block if true, another if false | `if ($x -gt 10) { Write-Host "Greater" } else { Write-Host "Smaller" }` |
| `if-elseif-else`  | Checks multiple conditions sequentially | `if ($x -gt 10) { Write-Host "Greater" } elseif ($x -eq 10) { Write-Host "Equal" } else { Write-Host "Smaller" }` |
| `switch`  | Evaluates an expression against multiple values | `switch ($x) { 1 { Write-Host "One" }; 2 { Write-Host "Two" }; default { Write-Host "Other" } }` |
| `?: (Ternary Operator)`  | Shorter syntax for if-else (PowerShell 7+) | `$result = ($x -gt 10) ? "Greater" : "Smaller"` |

