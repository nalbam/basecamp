
```
sudo vi /etc/wpa_supplicant/wpa_supplicant.conf

country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
  ssid="nalbam-bs"
  psk="01067684010"
}
```

```
git clone https://github.com/nalbam/nalbam-rpi

./nalbam-rpi/init.sh
./nalbam-rpi/init.sh arcade

npi lcd 8
npi roms s1.nalbam.com
```
