### setup
```
git clone https://github.com/certbot/certbot

cd certbot

./certbot-auto --help all
```

### Let's Encrypt
```
./certbot-auto --apache -d nalbam.com -d www.nalbam.com

./certbot-auto certonly --standalone --email admin@nalbam.com -d nalbam.com -d www.nalbam.com
```

### Amazon Linux
```
sudo ./certbot-auto --debug

sudo ./certbot-auto renew --debug
```
