$pass_ps = ConvertTo-SecureString '{{password}}' -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential("local\\{{domain}}",$pass_ps)
$ScriptBlock = {pause}
start-Process powershell.exe -Credential $Cred -ArgumentList "-Command Start-Process powershell.exe -Verb Runas -ArgumentList '-Command $ScriptBlock'"

Set-Location  "$env:ProgramFiles\Octopus Deploy\Tentacle\"
& .\tentacle.exe create-instance --instance "Tentacle" --config "C:\Octopus\Tentacle.config" --console;
& .\tentacle.exe new-certificate --instance "Tentacle" --if-blank --console;
Start-Sleep -s 10
& .\tentacle.exe configure --instance "Tentacle" --reset-trust --console;
& .\tentacle.exe configure --instance "Tentacle" --home "C:\Octopus" --app "C:\Octopus\Applications" --port "{{Octoport" --noListen "False" --console;
& .\tentacle.exe configure --instance "Tentacle" --trust "{{thum_octo_srv}}" --console;
& .\tentacle.exe service --instance "Tentacle" --install --start --console;
