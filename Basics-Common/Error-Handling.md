# PowerShell Error Handling Guide

## 1. Types of Errors in PowerShell

### A. Terminating Errors
- Stop script execution unless handled.
- Examples: Syntax errors, command not found, invalid permissions.

```powershell
Get-Item -Path "C:\InvalidPath" -ErrorAction Stop
```

### B. Non-Terminating Errors
- Do not stop script execution.
- Logged in `$Error` automatic variable.

```powershell
Get-Item -Path "C:\InvalidPath"
Write-Host "This message will still be displayed"
```

---

## 2. ErrorAction Parameter
Controls error handling behavior at the command level.

| ErrorAction Value | Behavior |
|-------------------|----------|
| `Continue` (default) | Displays error, continues execution |
| `Stop` | Converts the error into a terminating error |
| `SilentlyContinue` | Suppresses the error message, script continues |
| `Ignore` | Suppresses error without logging to `$Error` |
| `Inquire` | Prompts user for action |

```powershell
Get-Item -Path "C:\InvalidPath" -ErrorAction SilentlyContinue
Write-Host "Script execution continues..."
```

---

## 3. `$ErrorActionPreference` (Global Setting)
Sets the default error handling behavior for the session.
Default: `Continue`

```powershell
$ErrorActionPreference = "Stop"
Get-Item -Path "C:\InvalidPath"   # Now it will stop execution
```

---

## 4. Capturing Errors with `-ErrorVariable`
Stores errors in a custom variable without stopping execution.

```powershell
Get-Item -Path "C:\InvalidPath" -ErrorVariable MyError
Write-Host "Errors captured in `$MyError`: $MyError"
```

---

## 5. Try-Catch-Finally
Structured error handling using `try`, `catch`, and `finally`.

```powershell
try {
    Get-Item -Path "C:\InvalidPath" -ErrorAction Stop
}
catch {
    Write-Host "An error occurred: $_"
}
finally {
    Write-Host "Execution completed."
}
```

---

## 6. Throwing Custom Errors (`throw` Statement)
Generates a terminating error.

```powershell
function Test-Error {
    param ($value)
    if ($value -lt 0) {
        throw "Negative values are not allowed!"
    }
    Write-Host "Valid value: $value"
}

Test-Error -5   # This will throw an error
```

---

## 7. More on `about_Try_Catch_Finally`
To get official PowerShell documentation:

```powershell
Get-Help about_Try_Catch_Finally
```

---

## Summary

| Concept | Description |
|---------|-------------|
| **Terminating Errors** | Stop script execution unless handled |
| **Non-Terminating Errors** | Allow script execution to continue |
| **`-ErrorAction`** | Controls error behavior at the command level |
| **`$ErrorActionPreference`** | Sets default error behavior globally |
| **`-ErrorVariable`** | Captures errors in a custom variable |
| **Try-Catch-Finally** | Handles errors in a structured way |
| **Throw** | Generates custom terminating errors |

