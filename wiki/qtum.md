### download
```
https://github.com/qtumproject/qtum/releases

qtum-0.14.13-arm-linux-gnueabihf.tar.gz

tar zxvf qtum-0.14.13-arm-linux-gnueabihf.tar.gz
```

### service
```
sudo vi /etc/systemd/system/qtumd.service
```
```
[Unit]
Description=Qtum daemon service
After=network.target

[Service]
Type=forking
User=pi
WorkingDirectory=/home/pi/qtum-wallet
ExecStart=/home/pi/qtum-wallet/bin/qtumd -daemon=1 -par=2 -onlynet=ipv4 -noonion -listenonion=0 -maxconnections=24 -rpcbind=127.0.0.1 -rpcallowip=127.0.0.1
PIDFile=/home/pi/.qtum/qtumd.pid
Restart=always
RestartSec=1
KillSignal=SIGQUIT
KillMode=mixed

[Install]
WantedBy=multi-user.target
```

### execute
```
./qtumd &

sudo systemctl daemon-reload

sudo systemctl enable qtumd.service
sudo systemctl start qtumd.service
sudo systemctl stop qtumd.service

pgrep -a qtumd
```

### cli
```
~/qtum-wallet/bin/qtum-cli help
~/qtum-wallet/bin/qtum-cli version
~/qtum-wallet/bin/qtum-cli getinfo
~/qtum-wallet/bin/qtum-cli getwalletinfo
~/qtum-wallet/bin/qtum-cli getstakinginfo
```

### encrypt wallet
```
~/qtum-wallet/bin/qtum-cli -stdin encryptwallet

red dog blue cat
<CTRL-D>
```

### backup wallet
```
$ cp ~/.qtum/wallet.dat ./nalbam-qtum-backup.dat
```

### wallet reload
```
sudo systemctl stop qtumd.service
rm -f ~/.qtum/.lock ~/.qtum/qtumd.pid ~/.qtum/.cookie
sudo systemctl start qtumd.service
```

### wallet unlock
```
~/qtum-wallet/bin/qtum-cli -stdin walletpassphrase

red dog blue cat
99999999
true
<CTRL-D>
```

### wallet lock
```
~/qtum-wallet/bin/qtum-cli walletlock
```

### wallet address
```
~/qtum-wallet/bin/qtum-cli listaccounts

~/qtum-wallet/bin/qtum-cli getaccountaddress ""
~/qtum-wallet/bin/qtum-cli getaccountaddress "nalbam-qtum"
```

 * https://gist.github.com/JungWinter/e2182a766a10b779aeaba9127787d72b
 * https://steemit.com/qtum/@cryptominder/qtum-staking-tutorial-using-qtumd-on-a-raspberry-pi-3
 
