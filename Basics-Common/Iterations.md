# PowerShell Iteration Statements

| Loop Type  | Description | Example |
|------------|-------------|---------|
| **For Loop** | Executes a block of code a specified number of times | `for ($i=0; $i -lt 5; $i++) { Write-Host $i }` |
| **Foreach Loop** | Iterates over each item in a collection | `foreach ($item in 1..5) { Write-Host $item }` |
| **While Loop** | Repeats as long as the condition is true | `$i = 0; while ($i -lt 5) { Write-Host $i; $i++ }` |
| **Do-While Loop** | Executes at least once, then repeats while condition is true | `$i = 0; do { Write-Host $i; $i++ } while ($i -lt 5)` |
| **Do-Until Loop** | Executes at least once, then repeats until condition is true | `$i = 0; do { Write-Host $i; $i++ } until ($i -eq 5)` |
| **Foreach-Object** | Iterates over pipeline objects | `1..5 | ForEach-Object { Write-Host $_ }` |

