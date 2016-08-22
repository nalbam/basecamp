```
zabbix-release

rpm -Uvh http://repo.zabbix.com/zabbix/2.2/rhel/6/x86_64/zabbix-release-2.2-1.el6.noarch.rpm

yum list | grep zabbix | grep 2.2.7

yum -y install zabbix-server-mysql zabbix-web-mysql zabbix-web

yum -y install zabbix-agent zabbix-get

vi /etc/zabbix/zabbix_server.conf
DBUser=zabbix
DBPassword=NEWPASSWORD

zabbix
xzMWamPKYFqzKb8J

mysql -uroot -p zabbix < /usr/share/doc/zabbix-server-mysql-2.2.7/create/schema.sql
mysql -uroot -p zabbix < /usr/share/doc/zabbix-server-mysql-2.2.7/create/images.sql
mysql -uroot -p zabbix < /usr/share/doc/zabbix-server-mysql-2.2.7/create/data.sql

service zabbix-server restart

port : 10051


vi /etc/php.ini

date.timezone = Asia/Seoul

vi /etc/httpd/conf.d/zabbix.conf

<Directory /usr/share/zabbix>
	Options FollowSymLinks
	AllowOverride All
	Order deny,allow
	Allow from all
</Directory>

Alias  /zabbix  /usr/share/zabbix

service httpd restart
```
