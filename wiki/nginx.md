### install (yum)
```
sudo yum install nginx
sudo service nginx start
sudo  chkconfig nginx on
```

### install (compile)
```
wget https://nginx.org/download/nginx-1.11.3.tar.gz
tar xzf nginx-1.11.3.tar.gz
cd nginx-1.11.3

./configure
sudo make & make install
```

### php-fpm
```
sudo yum install php56-fpm
sudo service php-fpm start
sudo  chkconfig php-fpm on
```
