#----------
#OUTPUT PATH
#-----
If (Test-Path $env:UserProfile\Desktop\tracker) {Remove-Item -Path C:\Windows\Temp\tracker -Recurse}
New-Item -Path $env:UserProfile\Desktop -Name tracker -ItemType directory  | Out-Null
$folder = "$env:UserProfile\Desktop\tracker"
#-----
#----------

#----------
#SYSTEM INFORMATION
#-----
$compsys = Get-WmiObject win32_computersystem
$compsysprod = Get-WmiObject win32_computersystemproduct
$bios = Get-WmiObject win32_bios
$processor = Get-WmiObject win32_processor
$baseboard = Get-WmiObject win32_baseboard
$diskdrive = Get-WmiObject win32_diskdrive
$os = Get-WmiObject win32_operatingsystem
$graphics = Get-WmiObject win32_videocontroller
$ram = Get-WmiObject win32_physicalmemory
$domainadapter = Get-WmiObject win32_networkadapterconfiguration | Where-Object {$_.DnsDomain -like "burlington*"}
#-----
#-----
$syshostname = "Hostname: " + $compsys.DnsHostname
$sysdomain = "Domain: " + $compsys.Domain
$sysmfctr = "Manufacturer: " + $compsys.Manufacturer
$sysmodel = "Model: " + $compsys.Model
$sysfamily = "Family: " + $compsys.SystemFamily
$syssku = "SKU: " + $compsys.SystemSKUNumber
$sysowner = "Owner: " + $compsys.PrimaryOwnerName
$sysuser = "User: " + $compsys.UserName
$systimezone = "Timezone Offset: " + $compsys.CurrentTimeZone
$sysnetserver = "Network Server Enabled: " + $compsys.NetworkServerModeEnabled

$sysprodserial = "Serial Number: " + $compsysprod.IdentifyingNumber
$sysproduuid = "UUID: " + $compsysprod.UUID

$biosversion = "Version: " + $bios.SMBIOSBiosVersion
$biosrelease = "Release Date: " + [System.Management.ManagementDateTimeConverter]::ToDateTime($bios.ReleaseDate)

$cpumfctr = "Manufacturer: " + $processor.Manufacturer
$cpuname = "Model: " + $processor.Name
$cpucores = "Cores: " + $processor.NumberOfCores
$cpuenabled = "Enabled: " + $processor.NumberOfEnabledCore
$cpulogical = "Logical: " + $processor.NumberOfLogicalProcessors
$cpuid = "ID: " + $processor.ProcessorId
$cputhreads = "Threads: " + $processor.ThreadCount
$cpuvirt = "Virt Enabled: " + $processor.VirtualizationFirmwareEnabled

$basemother = "Motherboard: " + $baseboard.Manufacturer + " " + $baseboard.Product
$baseserial = "Serial: " + $baseboard.SerialNumber
$baseversion = "Version: " + $baseboard.Version

$diskid = "Device ID: " + $diskdrive.DeviceID
$diskmodel = "Model: " + $diskdrive.Model
$disksize = "Size: " + $diskdrive.Size
$diskpartitions = "Partitions: " + $diskdrive.Partitions
$diskinterface = "Interface Type: " + $diskdrive.InterfaceType
$disktype = "Media Type: " + $diskdrive.MediaType
$diskloaded = "Loaded: " + $diskdrive.MediaLoaded
$diskfirmware = "Firmware: " + $diskdrive.FirmwareRevision
$diskserial = "Serial: " + $diskdrive.SerialNumber

$osversion = "Version: " + $os.Caption + " " + $os.Version
$osarch = "Architecture: " + $os.OsArchitecture
$osorg = "Organization: " + $os.Organization
$osuser = "User: " + $os.RegisteredUser
$osboot = "Boot Drive: " + $os.BootDevice
$osserial = "Serial: " + $os.SerialNumber
$osinstalled = "Installed On: " + [System.Management.ManagementDateTimeConverter]::ToDateTime($os.InstallDate)
$oslastboot = "Last Boot: " + [System.Management.ManagementDateTimeConverter]::ToDateTime($os.LastBootUpTime)
$oslocaltime = "Local Time: " + [System.Management.ManagementDateTimeConverter]::ToDateTime($os.LocalDateTime)

$graphicscard = "Card: " + $graphics.VideoProcessor
$graphicstype = "Type: " + $graphics.AdapterDacType
$graphicsram = "Memory: " + $graphics.AdapterRam
$graphicsresolution = "Resolution: " + $graphics.CurrentHorizontalResolution + "x" + $graphics.CurrentVerticalResolution

$ramslot = "Slot: " + $ram.BankLabel + " " + $ram.DeviceLocator
$rammfctr = "Manufacturer: " + $ram.Manufacturer
$ramsize = "Size: " + $ram.Capacity
$ramclockspeed = "Configured Speed: " + $ram.ConfiguredClockSpeed
$rammaxspeed = "Max Speed: " + $ram.Speed
$ramformfactor = "Form Factor: " + $ram.FormFactor
$rampartnumber = "Part Number: " + $ram.PartNumber
$ramserial = "Serial: " + $ram.SerialNumber
$ramtype = "Type: " + $ram.SmBiosMemoryType

$domainip = "IP Address: " + $domainadapter.IpAddress
$domainsubnet = "Subnet: " + $domainadapter.IpSubnet
$domainmac = "MAC Address: " + $domainadapter.MacAddress
$domaingateway = "Default Gateway: " + $domainadapter.DefaultIpGateway
$domaincaption = "Caption: " + $domainadapter.Caption
$domainleaseobtained = "DHCP Lease Obtained: " + [System.Management.ManagementDateTimeConverter]::ToDateTime($domainadapter.DHCPLeaseObtained)
$domainleaseexpiry = "DHCP Lease Expires: " + [System.Management.ManagementDateTimeConverter]::ToDateTime($domainadapter.DHCPLeaseExpires)
#-----
#----------

#----------
#SYSTEM OUTPUT
#-----
$win32_computersystem = $syshostname, $sysdomain, $sysmfctr, $sysmodel, $sysfamily, $syssku, $sysowner, $sysuser, $systimezone, $sysnetserver
$win32_computersystemproduct = $sysprodserial, $sysproduuid
$win32_bios = $biosversion, $biosrelease
$win32_processor = $cpumfctr, $cpuname, $cpucores, $cpuenabled, $cpulogical, $cpuid, $cputhreads, $cpuvirt
$win32_baseboard = $basemother, $baseserial, $baseversion
$win32_diskdrive = $diskid, $diskmodel, $disksize, $diskpartitions, $diskinterface, $disktype, $diskloaded, $diskfirmware, $diskserial
$win32_operatingystem = $osversion, $osarch, $osorg, $osuser, $osboot, $osserial, $osinstalled, $oslastboot, $oslocaltime
$win32_videocontroller = $graphicscard, $graphicstype, $graphicsram, $graphicsresolution
$win32_physicalmemory = $ramslot, $rammfctr, $ramsize, $ramclockspeed, $rammaxspeed, $ramformfactor, $rampartnumber, $ramserial, $ramtype
$win32_networkadapterconfiguration = $domainip, $domainsubnet, $domainmac, $domaingateway, $domaincaption, $domainleaseobtained, $domainleaseexpiry
#-----
#-----
$sysoutput =
"`nSYSTEM INFORMATION",
"`nwin32_computersystem`n--------------------", $win32_computersystem,
"`nwin32_computer`n--------------------", $win32_computersystemproduct,
"`nwin32_bios`n--------------------", $win32_bios,
"`nwin32_processor`n--------------------", $win32_processor,
"`nwin32_baseboard`n--------------------", $win32_baseboard,
"`nwin32_diskdrive`n--------------------", $win32_diskdrive,
"`nwin32_operatingsystem`n--------------------", $win32_operatingystem,
"`nwin32_videocontroller`n--------------------", $win32_videocontroller,
"`nwin32_physicalmemory`n--------------------", $win32_physicalmemory,
"`nwin32_networkadapterconfiguration`n--------------------", $win32_networkadapterconfiguration,
"`n`n"
$sysoutput | Out-File $folder\"sysoutput.txt"
#-----
#----------

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
$Body = (Get-Content $folder\"sysoutput.txt" -Raw) + (Get-Content $folder\"network.txt" -Raw) + (Get-Content $folder\"monitor.txt" -Raw) + (Get-Content $folder\"filecheck.txt" -Raw)
$mail = "mail." + $compsys.Domain
Write-Host $Body
Send-MailMessage -SmtpServer $mail -To "hdesai@evertz.com" -From "Reports@5288.IT" -Body $Body -Subject $compsys.DnsHostname
Remove-Item -Path $env:UserProfile\Desktop\tracker -Recurse
