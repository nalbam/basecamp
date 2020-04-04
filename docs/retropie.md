# RetroPie

## wifi

```bash
sudo vi /etc/wpa_supplicant/wpa_supplicant.conf
```

```conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=US

network={
  ssid="nalbam-bs"
  psk="01067684010"
}
```

## rpi

```bash
git clone https://github.com/nalbam/rpi

./rpi/run.sh
./rpi/run.sh arcade
```

## roms

```bash
rsync -av /Volumes/CacheDisk/roms/ pi@retropie.local:/home/pi/RetroPie/roms/

aws s3 sync /Volumes/CacheDisk/roms/ s3://roms.nalbam.com/
```

## shader

```

```

## scraper

* <https://github.com/muldjord/skyscraper>

```bash
mkdir ~/skysource && cd ~/skysource
wget -q -O - https://raw.githubusercontent.com/muldjord/skyscraper/master/update_skyscraper.sh | bash

Skyscraper
```

## autologin

```
at command prompt, type sudo raspi-config
select option 3 in menu (Boot Options)
select option B1 (Desktopp/CLI)
select option B2 (Console Autologin)
```
