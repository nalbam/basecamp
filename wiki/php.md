### 설치 ###
```
# yum -y groupinstall "PHP Support"
# yum -y install php-mcrypt

# yum -y install php php-bcmath php-cli php-common php-gd php-ldap php-mbstring php-mcrypt \
php-mysql php-odbc php-pdo php-pear php-php-gettext php-xml php-xmlrpc

# yum -y install php55w php55w-gd php55w-mcrypt php55w-mbstring php55w-devel php55w-mysql

# yum -y install php56w php56w-gd php56w-mcrypt php56w-mbstring php56w-devel php56w-mysql

# yum -y install php70w php70w-gd php70w-mcrypt php70w-mbstring php70w-devel php70w-mysql
```

### open_tag ###
```
# vi /etc/php.ini

short_open_tag = On
```

### session ###
```
# chmod 777 /var/lib/php/session
```

### composer ###
```
$ curl -sS https://getcomposer.org/installer | php
$ sudo mv composer.phar /usr/local/bin/composer
```
