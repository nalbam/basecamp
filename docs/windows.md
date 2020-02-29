# Windows

## powershell (admin)

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y python
choco install -y python --version=3.7.6

choco install -y pyenv-win
choco install -y awscli

choco install -y nodejs
choco install -y serverless
```
