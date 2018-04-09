## setup
```
git clone https://github.com/certbot/certbot

~/certbot/certbot-auto --help all

sudo yum install -y augeas-libs libffi-devel python27-tools system-rpm-config
```

## Let's Encrypt
```
sudo ~/certbot/certbot-auto --email me@nalbam.com -d demo.nalbam.com

sudo ~/certbot/certbot-auto certonly --standalone --email me@nalbam.com -d demo.nalbam.com
```

## Amazon Linux
```
sudo ~/certbot/certbot-auto --email me@nalbam.com --debug

sudo ~/certbot/certbot-auto --nginx --email me@nalbam.com --debug

sudo ~/certbot/certbot-auto certonly --standalone --debug --email me@nalbam.com -d demo.nalbam.com

sudo ~/certbot/certbot-auto renew --debug
```
