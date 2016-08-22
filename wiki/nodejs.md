### install 
```
wget https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz

tar xf node-v4.4.7-linux-x64.tar.xz

sudo mv node-v4.4.7-linux-x64 /usr/local/

sudo ln -s /usr/local/node-v4.4.7-linux-x64/bin/node /usr/bin/node
sudo ln -s /usr/local/node-v4.4.7-linux-x64/bin/npm /usr/bin/npm

sudo npm -g install pm2

sudo ln -s /usr/local/node-v4.4.7-linux-x64/lib/node_modules/pm2/bin/pm2 /usr/bin/pm2
```

### express 
```
sudo npm install -g express-generator

cd /data/webapp/nalbam/node
express --session --ejs --css stylus myapp
cd /data/webapp/nalbam/node/myapp
npm install
```

### modules 
```
npm install express
npm install websocket
npm install socket.io
```

### forever 
```
npm install -g forever

cd /data/webapp/nalbam/node/myapp
forever start -a -l /data/log/forever.log -o /data/log/out.log -e /data/log/err.log --watchDirectory /data/webapp/nalbam/node/myapp -w --minUptime 1000 --spinSleepTime 1000 bin/www
```

### macos node uninstall 
```
sudo rm -rf /usr/local/{bin/{node,npm},lib/node_modules/npm,lib/node,share/man/*/node.*}
```

  * http://nodejs.org/
  * https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#enterprise-linux-and-fedora
