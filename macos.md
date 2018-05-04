## Homebrew - http://brew.sh/
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update && brew upgrade

brew install zsh wget telnet httpie git-secrets

brew install terraform graphviz
brew install kubernetes-cli kubernetes-helm kops

brew cask install iterm2
brew cask install java intellij-idea

brew cask install minikube kubernetes-cli kubernetes-helm
brew cask install minishift openshift-cli

brew cask install rdm
```

## docker-machine
```
brew install docker-machine-driver-xhyve

or

curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit && \
  chmod +x docker-machine-driver-hyperkit && \
  sudo mv docker-machine-driver-hyperkit /usr/local/bin/ && \
  sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit && \
  sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit
```

## ₩ -> `
```
vi /Users/nalbam/Library/KeyBindings/DefaultkeyBinding.dict
```
```
{
    "₩" = ("insertText:", "`");
}
```

## find mv
```
find . -iname "*.mp3" -exec mv {} mp3 \;
```

## SD Card
```
diskutil list

diskutil unmountDisk /dev/disk2
diskutil unmountDisk /dev/disk3

sudo dd bs=1m if=2017-11-29-raspbian-stretch.img of=/dev/disk2
sudo dd bs=1m if=retropie-4.0.2-rpi2_rpi3.img of=/dev/disk3

# 진행상황 : ctrl + t
```

## macOS Sierra USB
```
sudo /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia \
    --volume /Volumes/macOS\ Sierra \
    --applicationpath /Applications/Install\ macOS\ Sierra.app \
    --nointeraction
```
