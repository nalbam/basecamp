# Chocolatey

* <https://chocolatey.org/>

## Install with cmd.exe (Administrator)

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

## install

```
choco install -y git 7zip jq

choco install -y firefox
choco install -y slack
choco install -y dropbox

choco install -y vscode
choco install -y jdk8 maven
choco install -y nodejs

choco install -y docker
choco install -y kubernetes-cli kubernetes-helm draft
choco install -y terraform
```

## upgrade

```
choco list --local-only

choco upgrade -y git 7zip jq firefox slack dropbox

choco upgrade -y vscode jdk8 maven nodejs

choco upgrade -y docker kubernetes-cli kubernetes-helm draft terraform
```

## path

```
C:\ProgramData\chocolatey\bin
```
