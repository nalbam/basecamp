# MacOS

## Xcode

```bash
xcode-select --install
```

## Homebrew

* <http://brew.sh/>

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update && brew upgrade
brew install zsh wget telnet httpie git-lfs git-secrets jq yq

brew cask install google-chrome
brew cask install iterm2
brew cask install dropbox
brew cask install istat-menus
brew cask install visual-studio-code

brew install youtube-dl ffmpeg

brew cask install slack -> app store

curl -sL opspresso.github.io/toaster/install.sh | bash

brew cask install java
```

## DS_Store

```bash
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

find . -name ".DS_Store" -depth -exec rm {} \;
```

## startup sound

```bash
sudo nvram SystemAudioVolume=%20
```

## docker-machine

```bash
brew install docker-machine-driver-xhyve

# or

curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit && \
  chmod +x docker-machine-driver-hyperkit && \
  sudo mv docker-machine-driver-hyperkit /usr/local/bin/ && \
  sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit && \
  sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit
```

## ₩ -> `

```bash
mkdir -p ~/Library/KeyBindings/
vi ~/Library/KeyBindings/DefaultkeyBinding.dict
```

```dict
{
  "₩" = ("insertText:", "`");
}
```

## find mv

```bash
find . -iname "*.mp3" -exec mv {} mp3 \;
```

## bake SD Card

```bash
diskutil list

diskutil unmountDisk /dev/disk2

sudo dd bs=1m of=/dev/disk2 if=2020-02-13-raspbian-buster.img
sudo dd bs=1m of=/dev/disk2 if=retropie-4.5.1-rpi2_rpi3.img
sudo dd bs=1m of=/dev/disk2 if=sd-blob-b01.img

# status : ctrl + t
```

## download youtube

```bash
youtube-dl -F https://youtu.be/xxxx

youtube-dl -f 313+252 --recode-video https://youtu.be/xxxx
```
