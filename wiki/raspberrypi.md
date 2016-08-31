### account
```
pi
respberry
```

### config
```
sudo raspi-config
```
```
1. Expand Filesystem
5. Internationalisation Option -> I1 Change Locale
5. Internationalisation Option -> I3 Change Keyboard Layout
7. Overclock -> Pi2
8. Advanced Options -> A3 Memory Split -> 512
8. Advanced Options -> A9 Audio
```
```
sudo reboot
```

### zero otg
```
echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt
echo "dwc2" | sudo tee -a /etc/modules
echo "g_ether" | sudo tee -a /etc/modules
echo "g_hid" | sudo tee -a /etc/modules
```

### usb / module
```
lsusb
lsmod
```

### wi-fi
```
iwconfig
iwlist wlan0 scan
```
```
sudo vi /etc/network/interfaces
```
```
auto lo
iface lo inet loopback

iface eth0 inet dhcp

auto wlan0
allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-ssid "ssid"
wpa-psk "password"

iface default inet dhcp
```
```
sudo service networking restart
```
```
sudo ifdown wlan0 && sudo ifup wlan0

sudo wpa_cli scan && sleep 5 && sudo wpa_cli scan_results
```

### update
```
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install vim git dialog ttf-unfonts-core fbi

sudo apt-get -y install wiringpi
sudo apt-get -y install python-rpi.gpio

sudo apt-get -y install bluetooth blueman bluez
sudo apt-get -y install python-serial
sudo apt-get -y install python-bluez
```

### nalbam-shell
```
git clone https://github.com/nalbam/nalbam-shell.git
```

### waveshare 5inch hdmi
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
```
sudo reboot
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

### video
```
omxplayer video.mp4
 -b : blank
```

### font
```
sudo dpkg-reconfigure console-setup
```

### alsa
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
```
alsamixer

aplay -l
aplay -D plughw:1,0 test.wav

arecord -l
arecord -D plughw:1,0 test.wav
```

### espeak
```
espeak "hi, pi"
espeak "hi, pi" -w hi.wav

```

### bluetooth
```
sudo hcitool scan
```

### gpio
```
gpio readall
gpio -g read 18

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

sudo cp -R * /usr/local/
```

### kiosk
```
sudo apt-get -y install chromium x11-xserver-utils unclutter
sudo apt-get -y install midori x11-xserver-utils matchbox unclutter

vi ~/kiosk.sh

unclutter &
matchbox-window-manager &
midori -e Fullscreen -a http://localhost/

chmod 755 ~/kiosk.sh

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

sudo vi /etc/X11/xinit/xinitrc

xset s off         # don’t activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don’t blank the video device
```
