### 단축키
```
COMMAND + F3 : 모든 창 숨김

COMMAND + H : 현재 창 숨김
COMMAND + OPTION + H : 현재 창 제외하고 모두 숨김

COMMAND + M : 현재 창 최소화

COMMAND + W : 현재 창 닫기

CONTROL + COMMAND + D : 사전

OPTION + SHIFT + 볼륨 : 세밀하게 조절
```

### Homebrew - http://brew.sh/
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git zsh wget telnet httpie

brew cask install iterm2

brew install terraform graphviz

brew cask install rdm
```

### ₩ -> `
```
vi /Users/nalbam/Library/KeyBindings/DefaultkeyBinding.dict
```
```
{
    "₩" = ("insertText:", "`");
}
```

### find mv
```
find . -iname "*.mp3" -exec mv {} mp3 \;
```

### SD Card
```
diskutil list

diskutil unmountDisk /dev/disk2
diskutil unmountDisk /dev/disk3

sudo dd bs=1m if=2017-11-29-raspbian-stretch.img of=/dev/disk2
sudo dd bs=1m if=retropie-4.0.2-rpi2_rpi3.img of=/dev/disk3

진행상황 : ctrl + t
```

### macOS Sierra USB
```
sudo /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia \
    --volume /Volumes/macOS\ Sierra \
    --applicationpath /Applications/Install\ macOS\ Sierra.app \
    --nointeraction
```
