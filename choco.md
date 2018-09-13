# Chocolatey

* <https://chocolatey.org/>

## Install with cmd.exe (Administrator)

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

## Package

```
choco install -y git 7zip

choco install -y vscode
choco install -y zulu nodejs

choco install -y firefox
choco install -y slack
choco install -y dropbox

choco install -y docker
choco install -y kubernetes-cli kubernetes-helm draft
```
