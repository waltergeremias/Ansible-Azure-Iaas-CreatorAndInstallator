powershell.exe msiexec /i Octopus.msi /quiet
Start-Sleep -s 60
New-Item -ItemType directory -Path 'C:\Octopus'

Set-Location "$env:ProgramFiles\Octopus Deploy\Tentacle"
$pass_ps = ConvertTo-SecureString '{{password}}' -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential("local\\{{vm_user_name}}",$pass_ps)
$ScriptBlock = {.\tentacle.exe new-certificate --instance Tentacle --if-blank --console}


& .\tentacle.exe create-instance --instance "Tentacle" --config "C:\Octopus\Tentacle.config" --console;
& .\tentacle.exe configure --instance "Tentacle" --home "C:\Octopus" --app "C:\Octopus\Applications" --port "{{OctoPort}}" --noListen "False" --console;
& .\tentacle.exe configure --instance "Tentacle" --reset-trust --console;
& .\tentacle.exe configure --instance "Tentacle" --trust "{{thum_octo_srv}}" --console;
Start-Sleep -s 10


start-Process powershell.exe -Credential $Cred -ArgumentList "-Command Start-Process powershell.exe -Verb Runas -ArgumentList '-Command $ScriptBlock'"
& .\tentacle.exe service --instance "Tentacle" --install --start --console;

netsh advfirewall firewall add rule "name=Octopus Deploy Tentacle" dir=in action=allow protocol=TCP localport="{{OctoPort}}"
Start-Sleep -s 10
& .\tentacle.exe service --instance "Tentacle" --install --restart --console;

Start-Sleep -s 10

Start-service -Name "OctopusDeploy Tentacle"
