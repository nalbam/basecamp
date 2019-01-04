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

brew install zsh wget telnet httpie git-secrets jq

brew install terraform graphviz
brew install kubernetes-cli kubernetes-helm kops
brew install openshift-cli

brew cask install iterm2
brew cask install visual-studio-code
brew cask install istat-menus
brew cask install intellij-idea
brew cask install java

brew cask install minikube
brew cask install minishift

brew cask install rdm
```

## startup sound

```bash
sudo nvram SystemAudioVolume=%20
```

## docker-machine

```bash
brew install docker-machine-driver-xhyve

or

curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit && \
  chmod +x docker-machine-driver-hyperkit && \
  sudo mv docker-machine-driver-hyperkit /usr/local/bin/ && \
  sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit && \
  sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit
```

## ₩ -> `

```bash
vi /Users/nalbam/Library/KeyBindings/DefaultkeyBinding.dict
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

## SD Card

```bash
diskutil list

diskutil unmountDisk /dev/disk2
diskutil unmountDisk /dev/disk3

sudo dd bs=1m if=2017-11-29-raspbian-stretch.img of=/dev/disk2
sudo dd bs=1m if=retropie-4.0.2-rpi2_rpi3.img of=/dev/disk3

# status : ctrl + t
```
