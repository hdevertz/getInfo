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
#FILE CHECK
#-----
$driveroot = Get-PsDrive -PsProvider FileSystem | ForEach-Object {$_.Root} | Get-ChildItem
$drivewindows = Get-PsDrive -PsProvider FileSystem | ForEach-Object {"$($_.Root)Windows"} | Get-ChildItem | Where-Object {($_.Name -like "*.txt") -or ($_.Name -like "*.dll")}
$cachedbroker = Get-ChildItem C:\Users\$env:username\AppData\Local\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy
$cachedidentity = Get-ChildItem C:\Users\$env:username\AppData\Local\Microsoft\IdentityCache -Recurse
$cachedoneauth = Get-ChildItem C:\Users\$env:username\AppData\Local\Microsoft\OneAuth -Recurse
#-----
$filecheck = "`nFILE CHECK",
"`ndriveroot`n--------------------", $driveroot,
"`ndrivewindows`n--------------------", $drivewindows,
"`ncachedbroker`n--------------------", $cachedbroker,
"`ncachedidentity`n--------------------", $cachedidentity,
"`ncachedoneauth`n--------------------", $cachedoneauth
$filecheck | Out-File $folder\"filecheck.txt"
#-----
#----------



#----------
#EMAIL OUTPUT
#-----
$Body = (Get-Content $folder\"filecheck.txt" -Raw)
$mail = "mail." + $compsys.Domain
Write-Host $Body
Send-MailMessage -SmtpServer $mail -To "hdesai@evertz.com" -From "Reports@5288.IT" -Body $Body -Subject $compsys.DnsHostname
