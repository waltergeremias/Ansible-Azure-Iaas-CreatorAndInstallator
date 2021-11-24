Add-Content -Path $env:users\users\default\authorized_keys -Value 'ssh-rsa AAAA' -Force
Add-Content -Path $env:users\users\default\id_rsa -Value '-----BEGIN RSA PRIVATE KEY----- 
somekey
-----END RSA PRIVATE KEY-----' -Force
Get-WindowsCapability -Name OpenSSH.Server* -Online | Add-WindowsCapability -Online
Get-WindowsCapability -Name OpenSSH.Client* -Online | Add-WindowsCapability -Online
New-Item -ItemType directory -Path $env:programdata\ssh\
New-Item -ItemType directory -Path $env:windrive\PRG
Add-Content -Path $env:programdata\ssh\sshd_config -Value 'Port {{portSFTP}}
AuthorizedKeysFile      authorized_keys
Subsystem       sftp    sftp-server.exe' -Force
