$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$getInternalIP = Get-NetIPAddress | Format-Table
$getExternalIP = Invoke-RestMethod http://ipinfo.io/json
$datetime = Get-Date
$resultsExternal = "ExternalIP info: $getExternalIP`n Date and time: $datetime"
$resultsExternal | Out-File "$DesktopPath\ComputerExternalIPAddress.csv"
$resultsInternal = $getInternalIP + "Date and time: $datetime"
$resultsInternal | Out-File "$DesktopPath\ComputerInternalIPAddress.csv"