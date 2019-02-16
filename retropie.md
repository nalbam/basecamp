# RetroPie

## wifi

```
sudo vi /etc/wpa_supplicant/wpa_supplicant.conf
```
```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
  ssid="nalbam-bs"
  psk="01067684010"
}
```

## rpi

```
git clone https://github.com/nalbam/rpi
```

```
./rpi/init.sh
./rpi/init.sh arcade
```

## rsync

```
rsync -av /Users/nalbam/Downloads/roms/ pi@192.168.150.158:/home/pi/RetroPie/roms/
rsync -av pi@192.168.150.158:/home/pi/RetroPie/roms/ /Users/nalbam/Downloads/roms/
```

## scraper

```
sudo ./RetroPie-Setup/retripie_setup.sh

Manage Packages > Manage Optional Packages > scraper > install

Manage Packages > Manage Optional Packages > Choose an option for scraper
```

## shader
