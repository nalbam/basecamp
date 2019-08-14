# raspberrypi

## account

```bash
pi
raspberry
```

## ssh enable

```bash
sudo raspi-config
```

* Interfacing Options
  * Camera enable
  * SSH enable

## keyboard

```bash
sudo vi /etc/default/keyboard
```

```bash
XKBLAYOUT="us"
```

## usb / module

```bash
lsusb
lsmod
```

## network

```bash
sudo iwconfig
sudo iwlist wlan0 scan

sudo vi /etc/wpa_supplicant/wpa_supplicant.conf
```

```bash
network={
  ssid="SSID"
  psk="PASSWORD"
}
```

## update

```bash
sudo apt -y update
sudo apt -y upgrade

sudo apt install -y vim git dialog fbi wiringpi

sudo apt install -y ttf-unfonts-core

sudo apt install -y python-rpi.gpio

sudo apt install -y bluetooth blueman bluez
sudo apt install -y python-serial
sudo apt install -y python-bluez

sudo apt install -y arp-scan
```

## nodejs

```bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt install -y nodejs
```

## nalbam-rpi

```bash
git clone https://github.com/nalbam/rpi.git
```

## LCD 3.5

* <http://www.waveshare.com/w/upload/0/00/LCD-show-170703.tar.gz>

```bash
cd LCD-show/

./LCD-hdmi

./LCD-35show
./LCD-35show 90
```

## LCD 5

```bash
sudo vi /boot/config.txt
```

```bash
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

## usb-audio

```bash
sudoi vi /etc/modprobe.d/alsa-base.conf
```

```bash
# This sets the index value of the cards but doesn't reorder.
options snd_usb_audio index=0
options snd_bcm2835 index=1

# Does the reordering.
options snd slots=snd-usb-audio,snd-bcm2835
```

## sound

```bash
alsamixer

aplay -l
aplay -D plughw:0,0 hi.wav
aplay -D plughw:0,0 /usr/share/scratch/Media/Sounds/Vocals/Singer1.wav

arecord -l
arecord -D plughw:0,0 hi.wav
```

## espeak

```bash
sudo apt install -y espeak

espeak "hi, pi"
espeak "hi, pi" -w hi.wav
```

## mp3

```bash
sudo apt install -y mpg321

mpg321 -o alsa -a plughw:0,0 /usr/share/scratch/Media/Sounds/Vocals/Sing-me-a-song.mp3
```

## video

```bash
omxplayer /opt/vc/src/hello_pi/hello_video/test.h264
# -b : blank
# -o : output [local,hdmi,both]
```

## image

```bash
sudo apt install -y fbi
```

```bash
fbi image.jpg
# -noverbose : 하단 설명 없앰
# -a : autozoom
# -u : random
# -t 10 : timeout
# -d /dev/fb0 : 화면 지정
```

## camera

```bash
raspistill -o image.jpg
raspistill -w 960 -h 720 -t 500 -n -th none -x none -o image.jpg

# -p, --preview           미리보기 창 설정 <'x,y,w,h'>
# -f, --fullscreen        전체화면 미리보기 모드
# -n, --nopreview         미리보기 창을 표시하지 않음
# -po, --opacity          미리보기 창 투명도 설정

# -w, --width             이미지 폭 설정<크기>
# -h, --height            이미지 높이 설정<크기>
# -q, --quality           JPEG 품질 설정<0에서 100>
# -o, --output            출력 파일명<파일명>
# -t, --timeout           카메라가 촬영하고 꺼질 때까지의 시간
# -tl, --timelapse        타임랩스 모드
# -th, --thumb            썸네일 파라미터 설정(x:y:quality)
# -x, --exif              캡처에 적용할 EXIF 태그('키=값' 형식)
```

## qr

```bash
sudo apt install -y zbar-tools

raspistill -o image.jpg && zbarimg image.jpg
```

## bluetooth

```bash
sudo hcitool scan
```

## gpio

```bash
gpio readall
gpio -g read 18
```

```bash
gcc motor.c -o motor -lwiringPi
```

## face recognition

* <https://www.pyimagesearch.com/2018/09/26/install-opencv-4-on-your-raspberry-pi/>
* <https://www.pyimagesearch.com/2018/06/25/raspberry-pi-face-recognition/>

```bash
sudo apt-get -y purge wolfram-engine
sudo apt-get -y purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove

sudo apt install -y build-essential git cmake pkg-config
sudo apt install -y libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt install -y libxvidcore-dev libx264-dev
sudo apt install -y libgtk2.0-dev
sudo apt install -y libatlas-base-dev gfortran
sudo apt install -y python2.7-dev python3-dev

sudo pip install dlib
sudo pip install face_recognition
sudo pip install imutils
sudo pip install opencv

python face_encode.py --dataset dataset --encodings encodings.pickle --detection-method hog
python face_recognition.py --cascade haarcascade_frontalface_default.xml --encodings encodings.pickle
```

## zero otg

* <https://gist.github.com/gbaman/50b6cca61dd1c3f88f41>
* <https://gist.github.com/gbaman/975e2db164b3ca2b51ae11e45e8fd40a>

```bash
echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt
echo "dwc2" | sudo tee -a /etc/modules
echo "g_ether" | sudo tee -a /etc/modules
echo "g_hid" | sudo tee -a /etc/modules
```
