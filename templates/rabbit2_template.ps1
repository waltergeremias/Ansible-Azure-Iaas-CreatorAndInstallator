Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Set-Location "$env:programfiles\rabbitmq\sbin\";cmd.exe /C "rabbitmq-service.bat start";Start-Sleep -s 7
Set-Location "$env:programfiles\rabbitmq\sbin\";cmd.exe /C ".\rabbitmqctl.bat add_user {{Rabbit_User}} {{Rabbit_Pass}}";Start-Sleep -s 2
Set-Location "$env:programfiles\rabbitmq\sbin\";cmd.exe /C ".\rabbitmqctl.bat set_user_tags {{Rabbit_User}} administrator";Start-Sleep -s 2
Set-Location "$env:programfiles\rabbitmq\sbin\";cmd.exe /C '.\rabbitmqctl.bat set_permissions -p / {{Rabbit_User}}  "." "." "."';Start-Sleep -s 2
Set-Location "$env:programfiles\rabbitmq\sbin\";cmd.exe /C ".\rabbitmq-plugins.bat enable rabbitmq_management"
#cmd.exe /C 'rabbitmqctl.bat set_permissions -p / {{Rabbit_User}}  "." "." "."'
