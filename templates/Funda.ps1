New-Item -ItemType directory -Path 'C:\PRG'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/7zip.msi' -OutFile 'C:\PRG\7zip.msi'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/chrome.msi' -OutFile 'C:\PRG\chrome.msi'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/notepad.exe' -OutFile 'C:\PRG\notepadp.exe'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/du.zip' -OutFile 'C:\PRG\du.zip' 
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/putty.msi' -OutFile 'C:\PRG\putty.msi'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/Some.zip' -OutFile 'C:\PRG\SMAex5.zip'
Invoke-WebRequest -UseBasicParsing -Uri 'https://some.blob.core.windows.net/azurebuild/fundamental.ps1' -OutFile 'C:\PRG\fundamental.ps1'
& "C:\PRG\fundamental.ps1";
