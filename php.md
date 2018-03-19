### 설치 
```
sudo yum -y install php55w php55w-gd php55w-mcrypt php55w-mbstring php55w-devel php55w-mysql

sudo yum -y install php56w php56w-gd php56w-mcrypt php56w-mbstring php56w-devel php56w-mysql

sudo yum -y install php70w php70w-gd php70w-mcrypt php70w-mbstring php70w-devel php70w-mysql
```

### open_tag 
```
sudo vi /etc/php.ini

short_open_tag = On
expose_php = Off

date.timezone = Asia/Seoul
```

### session 
```
sudo chmod 777 /var/lib/php/session
```

### composer 
```
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

### swagger
```
composer global require zircote/swagger-php
```
