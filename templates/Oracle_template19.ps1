##OracleWin19
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/ansible/oracle_db19.zip' -OutFile 'C:\PRG\oracle_db19.zip'
[Environment]::SetEnvironmentVariable({ORACLE_HOME}, 'C:\PRG\ORACLE\' , [System.EnvironmentVariableTarget]::Machine) 
[Environment]::SetEnvironmentVariable({ORACLE_HOME}, 'C:\PRG\ORACLE\' , [System.EnvironmentVariableTarget]::Process)
[Environment]::SetEnvironmentVariable({ORACLE_HOME}, 'C:\PRG\ORACLE\' , [System.EnvironmentVariableTarget]::User)
New-NetFirewallRule -Name OracleServer -DisplayName 'OracleServer' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 1521
Start-Sleep -s 60
powershell.exe Expand-Archive 'C:\PRG\oracle_db19.zip' -DestinationPath 'C:\PRG\Oracle'
Start-Sleep -s 60
Set-ExecutionPolicy -ExecutionPolicy bypass -Scope CurrentUser
powershell.exe -noexit -windowstyle hidden -command 'C:\PRG\Oracle\setup.exe' -silent -force -waitForCompletion -noconsole  oracle.install.option=INSTALL_DB_AND_CONFIG oracle.install.db.config.starterdb.password.ALL='{{oracledb_password}}' oracle.install.IsVirtualAccount=true oracle.install.IsBuiltInAccount=false oracle.install.db.config.starterdb.fileSystemStorage.dataLocation='C:\ORACLE\oradata' oracle.install.db.config.starterdb.storageType=FILE_SYSTEM_STORAGE oracle.install.db.config.starterdb.enableRecovery=false oracle.install.db.config.starterdb.managementOption=DEFAULT oracle.install.db.config.starterdb.installExampleSchemas=false oracle.install.db.config.starterdb.memoryLimit=1638 oracle.install.db.config.starterdb.memoryOption=true oracle.install.db.config.starterdb.characterSet=AL32UTF8 oracle.install.db.config.PDBName=oracle oracle.install.db.ConfigureAsContainerDB=true oracle.install.db.config.starterdb.SID='{{oracledb_user}}' oracle.install.db.config.starterdb.globalDBName='{{oracledb_user}}' oracle.install.db.config.starterdb.type=GENERAL_PURPOSE oracle.install.db.InstallEdition=EE ORACLE_BASE='C:\ORACLE'
 
