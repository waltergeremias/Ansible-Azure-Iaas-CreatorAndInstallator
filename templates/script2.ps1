$pass_ps = ConvertTo-SecureString '{{password}}' -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("local\{{domain}}",$pass_ps)
$session = New-PSSession -ComputerName 127.0.0.1 -credential $cred
Start-Process -FilePath powershell.exe -Verb RunAs -ArgumentList "-ExecutionPolicy Bypass -command Invoke-Command -session $session -scriptblock {exit}"
Set-Service -Name sshd -StartupType 'Automatic'
Set-Service -Name ssh-agent -StartupType 'Automatic'
Start-Service sshd,ssh-agent
ssh-add.exe $env:windrive\users\{{vm_user_name}}\id_rsa
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 8080
