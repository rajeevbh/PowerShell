# PowerShell Output Commands

| Command         | Description | Example |
|---------------|-------------|---------|
| **Write-Host**   | Displays output directly to the console without returning an object. | `Write-Host "Hello, World!"` |
| **Write-Output** | Sends output to the pipeline, allowing further processing. | `Write-Output "Hello, Pipeline!"` |
| **Write-Error**  | Generates an error message in the error stream. | `Write-Error "This is an error message."` |
| **Write-Warning** | Displays a warning message in yellow. | `Write-Warning "This is a warning message."` |
| **Write-Debug**  | Writes debug information, visible when `$DebugPreference` is set to "Continue". | `$DebugPreference = "Continue"; Write-Debug "Debugging info"` |
| **Write-Verbose** | Writes detailed output, visible when `$VerbosePreference` is set to "Continue". | `$VerbosePreference = "Continue"; Write-Verbose "Verbose output"` |
