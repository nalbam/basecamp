# longvinter

> allow UDP ports 7777
> allow UDP/TCP ports 27015-27016

## prepare

```bash
sudo amazon-linux-extras install epel -y
sudo yum-config-manager --enable epel

sudo yum install -y git-lfs
```

## user

```bash
sudo useradd -m -d /home/steam steamcmd
sudo passwd steamcmd
sudo usermod -aG sudo steamcmd
sudo su steamcmd
```

## steamcmd

```bash
# Install SteamCMD pre-reqs
sudo yum install -y glibc.i686 libstdc++48.i686

# Install 7 Days to Die pre-reqs
sudo yum install -y mesa-libGLU libXcursor libXrandr

# Download SteamCMD
wget 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz'

# Unpack SteamCMD
tar -xzvf steamcmd_linux.tar.gz && rm -f steamcmd_linux.tar.gz

# Launch SteamCMD
./steamcmd.sh

# Downloads updates and all that. Once it is done, verify that logging in
# works (and enter SteamGuard code if required)
login YOURSTEAMUSERNAME YOURSTEAMPASSWORD

# Exit interactive session
exit
```

## steam sdk

```bash
mkdir -p cd ~/.steam/sdk64
cp ~/linux64/steamclient.so ~/.steam/sdk64/
```

## longvinter

```bash
git clone https://github.com/Uuvana-Studios/longvinter-linux-server.git

~/longvinter-linux-server/Longvinter/Saved/Config/LinuxServer/Game.ini
```

```
[/game/blueprints/server/gi_advancedsessions.gi_advancedsessions_c]
ServerName=Daangn Island
MaxPlayers=32
ServerMOTD=Welcome to Daangn Island!
Password=karrot
CommunityWebsite=www.longvinter.com - [longvinter.com]

[/game/blueprints/server/gm_longvinter.gm_longvinter_c]
AdminSteamID=76561197985393221
PVP=true
```

## start

```bash
sh /home/steam/longvinter-linux-server/LongvinterServer.sh
```
