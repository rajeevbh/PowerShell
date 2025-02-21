# PowerShell Conditional Operators

| Operator  | Description | Example |
|-----------|-------------|---------|
| `-and`  | Logical AND (Both conditions must be true) | `(5 -gt 3) -and (10 -lt 20)` → `$true` |
| `-or`  | Logical OR (At least one condition must be true) | `(5 -gt 10) -or (10 -lt 20)` → `$true` |
| `-xor`  | Logical XOR (Only one condition can be true) | `(5 -gt 3) -xor (10 -lt 20)` → `$false` |
| `-not`  | Logical NOT (Negates the condition) | `-not (5 -gt 10)` → `$true` |
| `!`  | Alternative syntax for `-not` | `!(5 -gt 10)` → `$true` |

