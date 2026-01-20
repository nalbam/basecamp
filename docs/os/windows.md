# Windows

## powershell (admin)

### winget

```PowerShell
winget install -e --id 7zip.7zip
winget install -e --id cURL.cURL
winget install -e --id junegunn.fzf

winget install -e --id Google.Chrome
winget install -e --id AgileBits.1Password

winget install -e --id Nvidia.GeForceExperience

winget install -e --id Dropbox.Dropbox
winget install -e --id Plex.PlexMediaServer
winget install -e --id Valve.Steam
winget install -e --id dotPDN.PaintDotNet
winget install -e --id SlackTechnologies.Slack
winget install -e --id Zoom.Zoom

winget install -e --id Daum.PotPlayer
winget install -e --id VideoLAN.VLC

winget install -e --id Ultimaker.Cura
winget install -e --id OBSProject.OBSStudio

winget install -e --id Microsoft.VisualStudioCode

winget install -e --id Sysinternals.Autoruns
winget install -e --id Piriform.CCleaner

# winget install -e --id Git.Git
# winget install -e --id Python.Python.3.8
# winget install -e --id Amazon.AWSCLI
# winget install -e --id Oracle.JavaRuntimeEnvironment
# winget install -e --id OpenJS.NodeJS
# winget install -e --id Docker.DockerDesktop
# winget install -e --id Hashicorp.Terraform
# winget install -e --id Kubernetes.kubectl
# winget install -e --id Helm.Helm
# winget install -e --id Derailed.k9s
```

### chocolatey

* ~https://chocolatey.org/install~

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install -y 7zip
choco install -y curl
choco install -y fzf
choco install -y dotnetfx

choco install -y googlechrome
choco install -y 1password

choco install -y nvidia-display-driver

choco install -y dropbox
choco install -y plexmediaserver
choco install -y steam-client
choco install -y paint.net
choco install -y slack
choco install -y zoom

choco install -y potplayer
choco install -y vlc

choco install -y cura-new
choco install -y obs-studio
choco install -y sidequest

choco install -y vscode
choco install -y dejavufonts
choco install -y nanum-gothic-coding-font

choco install -y autoruns
choco install -y ccleaner

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

## GoodbyeDPI

* https://github.com/ValdikSS/GoodbyeDPI
