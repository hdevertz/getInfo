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
#NETWORKING INFORMATION
#-----
$nltest = nltest /dsgetdc:
$ipconfig = ipconfig /all
$wild = netsh wlan show profiles "Evertz Wild" key=clear
$route = route print
#-----
$network =
"`nNETWORK INFORMATION",
"`nnltest`n--------------------", $nltest,
"`nipconfig`n--------------------", $ipconfig,
"`nwlan`n--------------------", $wild,
"`nroute`n--------------------", $route,
"`n`n"
$network | Out-File $folder\"network.txt"
#-----
#----------





#----------
#EMAIL OUTPUT
#-----
$Body = (Get-Content $folder\"network.txt" -Raw)
$mail = "mail." + $compsys.Domain
Write-Host $Body
Send-MailMessage -SmtpServer $mail -To "hdesai@evertz.com" -From "Reports@5288.IT" -Body $Body -Subject $compsys.DnsHostname
