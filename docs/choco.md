# Chocolatey

* <https://chocolatey.org/>

## Install with cmd.exe (Administrator)

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

## install

```
choco install -y git jq curl fzf
choco install -y nanum-gothic-coding-font dejavufonts
choco install -y nvidia-display-driver
choco install -y 1password 7zip GoogleChrome potplayer steam-client
choco install -y slack dropbox zoom
choco install -y obs-studio paint.net

choco install -y vscode jdk8 maven nodejs

choco install -y docker
choco install -y awscli kubernetes-cli kubernetes-helm draft
choco install -y terraform
```

## upgrade

```
choco list

choco upgrade -y all
```

## path

```
C:\ProgramData\chocolatey\bin
```
