# Chocolatey

* <https://chocolatey.org/>
* <https://chocolatey.org/install>

## Install with powershell.exe (Administrator)

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

## install

```
choco install -y git jq curl fzf
choco install -y dejavufonts
choco install -y nvidia-display-driver
choco install -y 1password 7zip GoogleChrome potplayer steam-client
choco install -y vscode slack zoom
choco install -y obs-studio paint.net

choco install -y jdk8 maven nodejs

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
