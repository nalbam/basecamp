# Windows

## powershell (admin)

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install -y 7zip
choco install -y curl
choco install -y fzf
choco install -y dotnetfx
choco install -y autoruns

choco install -y nvidia-display-driver

choco install -y 1password
choco install -y googlechrome

choco install -y paint.net
choco install -y zoom
choco install -y dropbox
choco install -y slack
choco install -y adobereader

choco install -y cura-new
choco install -y obs-studio
choco install -y sidequest
choco install -y plexmediaserver
choco install -y steam-client
choco install -y potplayer

choco install -y vscode
choco install -y dejavufonts
choco install -y nanum-gothic-coding-font

# choco install -y git
# choco install -y python --version=3.8.10
# choco install -y pyenv-win
# choco install -y awscli
# choco install -y jre8
# choco install -y nodejs
# choco install -y docker-desktop
# choco install -y terraform
# choco install -y kubernetes-cli
# choco install -y kubernetes-helm
# choco install -y k9s
```

## wsl

* https://docs.microsoft.com/ko-kr/windows/wsl/install

```PowerShell
wsl --install

wsl -l -v

```
