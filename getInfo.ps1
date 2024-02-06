$hostname = (Get-WmiObject win32_computersystem).DnsHostname
$username = (Get-WmiObject win32_computersystem).Username
Write-Host "Hostname: $hostname"
Write-Host "Current user: $username"
