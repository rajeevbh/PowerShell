## Read-Host
- $name = Read-Host "Enter host name"
- [string]$name = Read-Host "Enter hostname: "
- [int]$num = Read-Host "Enter a num: "
- [Datetime]$date = Read-Host "Enter date: "
- [char]$response = Read-Host "Do you want to continue(Y/N): "
- $password = Read-Host "Enter passsword: " -AsSecureString
## Read-Host with validation
- [ValidateLength(5,120)]$name = [String] (Read-Host "Enter hostname: ")
- [ValidateRange(1,100)]$num = [Int] (Read-Host "Enter age: ")
- [Datetime]$date = [Datetime] (Read-Host "Enter date: ")
- [ValidateSet("Y","N","y","n")]$response = [char] (Read-Host "Do you want to continue(Y/N): ")
- $password = Read-Host "Enter passsword: " -AsSecureString
