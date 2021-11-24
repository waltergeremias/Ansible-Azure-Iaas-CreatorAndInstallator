Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/otp.exe' -OutFile 'C:\PRG\otp.exe'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/rabbitmq.zip' -OutFile 'C:\PRG\rabbitmq.zip'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/installRabbit.ps1' -OutFile 'C:\PRG\installRabbit.ps1'
& "C:\PRG\installRabbit.ps1";

