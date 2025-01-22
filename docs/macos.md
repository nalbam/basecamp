# MacOS

## dotfiles

```bash
bash -c "$(curl -fsSL nalbam.github.io/dotfiles/run.sh)"
```

## toaster

```bash
bash -c "$(curl -fsSL opspresso.github.io/toaster/install.sh)"
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

## find mv

```bash
find . -iname "*.mp3" -exec mv {} mp3 \;
```

## bake SD Card

```bash
diskutil list

diskutil unmountDisk /dev/disk2

sudo dd bs=1m of=/dev/disk2 if=2021-01-11-raspios-buster-armhf-full.img
sudo dd bs=1m of=/dev/disk2 if=retropie-4.5.1-rpi2_rpi3.img
sudo dd bs=1m of=/dev/disk2 if=sd-blob-b01.img

# status : ctrl + t
```

## download youtube

```bash
youtube-dl -F https://youtu.be/xxxx

youtube-dl -f 313+252 --recode-video https://youtu.be/xxxx
```
