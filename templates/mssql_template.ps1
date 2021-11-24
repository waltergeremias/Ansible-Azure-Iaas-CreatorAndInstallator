##mssqlWin
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/SQLServer2019-DEV-x64-ENU.box' -OutFile 'C:\PRG\SQLServer2019-DEV-x64-ENU.box'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/SQLServer2019-DEV-x64-ENU.exe' -OutFile 'C:\PRG\SQLServer2019-DEV-x64-ENU.exe'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/ODAC.zip' -OutFile 'C:\PRG\ODAC.zip'
Set-Location "C:\PRG\"
powershell.exe 'C:\PRG\SQLServer2019-DEV-x64-ENU.exe' /Q 
powershell.exe Expand-Archive 'C:\PRG\ODAC.zip' -DestinationPath 'C:\PRG\ODAC'
Start-sleep -s 90

New-NetFirewallRule -Name MSSqlServer -DisplayName 'MssqlServer' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 1433
