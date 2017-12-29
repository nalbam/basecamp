### account
```
pi
respberry
```

### ssh enable
```
sudo raspi-config

- Interfaceing config
- SSH enable
```

### keyboard
```
sudo vi /etc/default/keyboard

XKBLAYOUT="us"
```

### usb / module
```
lsusb
lsmod
```

### network
```
sudo iwconfig
sudo iwlist wlan0 scan
```
```
sudo vi /etc/wpa_supplicant/wpa_supplicant.conf

network={
  ssid="SSID"
  psk="PASSWORD"
}
```

### zero otg
 * https://gist.github.com/gbaman/50b6cca61dd1c3f88f41
 * https://gist.github.com/gbaman/975e2db164b3ca2b51ae11e45e8fd40a
```
echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt
echo "dwc2" | sudo tee -a /etc/modules
echo "g_ether" | sudo tee -a /etc/modules
echo "g_hid" | sudo tee -a /etc/modules
```

### update
```
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install vim git dialog fbi wiringpi

sudo apt-get -y install ttf-unfonts-core

sudo apt-get -y install python-rpi.gpio

sudo apt-get -y install bluetooth blueman bluez
sudo apt-get -y install python-serial
sudo apt-get -y install python-bluez
```

### nalbam-rpi
```
git clone https://github.com/nalbam/nalbam-rpi.git
```

### 5inch LCD
```
sudo vi /boot/config.txt
```
```
# uncomment if hdmi display is not detected and composite is being output
hdmi_force_hotplug=1

# uncomment to force a specific HDMI mode (this will force VGA)
hdmi_group=2
hdmi_mode=87
hdmi_cvt 800 480 60 6 0 0 0

# Next two lines forces audio through the jack - HDMI-audio crashes the display!
hdmi_drive=1
hdmi_ignore_edid_audio=1
```

### image
```
sudo apt-get -y install fbi
```
```
fbi image.jpg
 -noverbose : 하단 설명 없앰
 -a : autozoom
 -u : random
 -t 10 : timeout
 -d /dev/fb0 : 화면 지정
```

### usb-audio
```
sudoi vi /etc/modprobe.d/alsa-base.conf
```
```
# This sets the index value of the cards but doesn't reorder.
options snd_usb_audio index=0
options snd_bcm2835 index=1

# Does the reordering.
options snd slots=snd-usb-audio,snd-bcm2835
```

### sound
```
alsamixer

aplay -l
aplay -D plughw:0,0 hi.wav
aplay -D plughw:0,0 /usr/share/scratch/Media/Sounds/Vocals/Singer1.wav

arecord -l
arecord -D plughw:0,0 hi.wav
```

### espeak
```
sudo apt-get -y install espeak

espeak "hi, pi"
espeak "hi, pi" -w hi.wav
```

### mp3
```
sudo apt-get -y install mpg321

mpg321 -o alsa -a plughw:0,0 /usr/share/scratch/Media/Sounds/Vocals/Sing-me-a-song.mp3
```

### video
```
omxplayer /opt/vc/src/hello_pi/hello_video/test.h264
 -b : blank
 -o : output [local,hdmi,both]
 
 not support usb audio
```

### bluetooth
```
sudo hcitool scan
```

### gpio
```
gpio readall
gpio -g read 18
```
```
gcc motor.c -o motor -lwiringPi
```

### apm
```
sudo apt-get -y install apache2 php5 mysql-server mysql-client php5-mysql phpmyadmin

sudo service apache2 restart

cd /etc/apache2/
```

### node.js
```
wget https://nodejs.org/dist/v4.4.1/node-v4.4.1-linux-armv7l.tar.gz
tar -xvf node-v4.4.1-linux-armv7l.tar.gz
cd node-v4.4.1-linux-armv7l
```
```
sudo cp -R * /usr/local/
```

### kiosk
```
sudo apt-get -y install x11-xserver-utils matchbox unclutter
```
```
vi ~/kiosk.sh

unclutter &
matchbox-window-manager &
chromium-browser --noerrdialogs --incognito \
                 --disable-session-crashed-bubble \
                 --disable-infobars \
                 --kiosk http://kiosk.nalbam.com/index.php?location=LOCATION

chmod 755 ~/kiosk.sh
```
```
sudo vi ~/.config/lxsession/LXDE-pi/autostart

@xset s off
@xset -dpms
@xset s noblank
@/home/pi/kiosk.sh
```

### screensaver
```
sudo vi /etc/lightdm/lightdm.conf

[SeatDefaults]
xserver-command=X -s 0 -dpms
```
```
sudo vi /etc/X11/xinit/xinitrc

xset s off         # don’t activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don’t blank the video device
```

### LCD 3.5
 * http://www.waveshare.com/w/upload/0/00/LCD-show-170703.tar.gz
```
./LCD-show
./LCD-show 90
```
