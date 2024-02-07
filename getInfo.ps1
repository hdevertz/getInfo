#----------
#OUTPUT PATH
#-----
If (Test-Path $env:UserProfile\Desktop\tracker) {Remove-Item -Path C:\Windows\Temp\tracker -Recurse}
New-Item -Path $env:UserProfile\Desktop -Name tracker -ItemType directory  | Out-Null
$folder = "$env:UserProfile\Desktop\tracker"
#-----
#----------
$compsys = Get-WmiObject win32_computersystem

#----------
#MONITOR INFORMATION
#----
Get-CimInstance -Namespace root/wmi -ClassName wmimonitorid | Select-Object @{Name="MonitorName";Expression={
    if ($_.UserFriendlyNameLength -eq 0) {
        "None"
    }
    else {
        ($_.UserFriendlyName -ne 0 | foreach { [char]$_}) -join ""
    }
}}, @{Name="MonitorSerial";Expression={
    if ($_.SerialNumberIDLength -eq 0) {
        "N/A"
    }
    else {
        ($_.SerialNumberID -ne 0 | foreach { [char]$_}) -join ""
    }
}} | Out-File $folder\"monitor.txt"
#-----
#----------





#----------
#EMAIL OUTPUT
#-----
$Body = (Get-Content $folder\"monitor.txt" -Raw)
$mail = "mail." + $compsys.Domain
Write-Host $Body
Send-MailMessage -SmtpServer $mail -To "hdesai@evertz.com" -From "Reports@5288.IT" -Body $Body -Subject $compsys.DnsHostname
