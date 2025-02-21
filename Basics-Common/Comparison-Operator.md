# PowerShell Comparison Operators

| Operator  | Description | Example |
|-----------|-------------|---------|
| `-eq`  | Equal to | `5 -eq 5` → `$true` |
| `-ne`  | Not equal to | `5 -ne 3` → `$true` |
| `-gt`  | Greater than | `5 -gt 3` → `$true` |
| `-ge`  | Greater than or equal to | `5 -ge 5` → `$true` |
| `-lt`  | Less than | `3 -lt 5` → `$true` |
| `-le`  | Less than or equal to | `3 -le 5` → `$true` |
| `-like`  | Wildcard pattern matching | `"hello" -like "h*o"` → `$true` |
| `-notlike`  | Wildcard pattern mismatch | `"hello" -notlike "h*z"` → `$true` |
| `-match`  | Regular expression match | `"hello123" -match "\d+"` → `$true` |
| `-notmatch`  | Regular expression mismatch | `"hello" -notmatch "\d+"` → `$true` |
| `-contains`  | Checks if a collection contains a value | `1,2,3 -contains 2` → `$true` |
| `-notcontains`  | Checks if a collection does not contain a value | `1,2,3 -notcontains 4` → `$true` |
| `-in`  | Checks if a value exists in a collection | `2 -in 1,2,3` → `$true` |
| `-notin`  | Checks if a value does not exist in a collection | `4 -notin 1,2,3` → `$true` |
| `-is`  | Checks if an object is a specific type | `"Hello" -is [string]` → `$true` |
| `-isnot`  | Checks if an object is not a specific type | `5 -isnot [string]` → `$true` |

