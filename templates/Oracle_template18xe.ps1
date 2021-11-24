##OracleWin18xe
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/oracle_db18xe.zip' -OutFile 'C:\PRG\oracle_db18xe.zip'
[Environment]::SetEnvironmentVariable({ORACLE_HOME}, 'C:\ORACLE\product\18.0.0\dbhomeXE' , [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable({ORACLE_HOME}, 'C:\ORACLE\product\18.0.0\dbhomeXE' , [System.EnvironmentVariableTarget]::Process)
[Environment]::SetEnvironmentVariable({ORACLE_HOME}, 'C:\ORACLE\product\18.0.0\dbhomeXE' , [System.EnvironmentVariableTarget]::User)

New-NetFirewallRule -Name OracleServer -DisplayName 'OracleServer' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 1521
Start-Sleep -s 10
powershell.exe Expand-Archive 'C:\PRG\oracle_db18xe.zip' -DestinationPath 'C:\PRG\Oracle'
Start-Sleep -s 60

Add-Content -Path 'C:\PRG\Oracle\XEInstaller.rsp' -Value 'INSTALLDIR=C:\Oracle\product\18.0.0\
PASSWORD="{{oracledb_password}}"
LISTENER_PORT=1521
EMEXPRESS_PORT=5500
CHAR_SET=WE8ISO8859P1' -Force

Set-Location 'C:\PRG\Oracle\'
Set-ExecutionPolicy -ExecutionPolicy Allsigned  
cmd.exe /C "C:\PRG\Oracle\setup.exe /s /v"RSP_FILE=C:\PRG\Oracle\XEInstaller.rsp" /v"/L*v setup.log" /v"/qn""

 
