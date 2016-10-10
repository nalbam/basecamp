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

brew install zsh
brew install maven
brew install archey
```

### SD Card
```
diskutil list

diskutil unmountDisk /dev/disk2

sudo dd bs=1m if=2016-09-23-raspbian-jessie.img of=/dev/disk2

진행상황 : ctrl + t
```
