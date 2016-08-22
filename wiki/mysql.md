### 설치
```
# yum -y groupinstall "MySQL Database server"
```

### 설정
```
# cp /usr/share/mysql/my-huge.cnf /etc/my.cnf
# cp /usr/share/mysql/my-large.cnf /etc/my.cnf
# cp /usr/share/mysql/my-medium.cnf /etc/my.cnf
# cp /usr/share/mysql/my-small.cnf /etc/my.cnf
```

```
my-huge.cnf     1~2G
my-large.cnf    512M
my-medium.cnf   128M~ 256M
my-small.cnf    64M 이하
```

```
# vi /etc/my.cnf
```

```
[client]
default-character-set = utf8

[mysqld]
init_connect = SET collation_connection = utf8_general_ci
init_connect = SET NAMES utf8
character-set-server = utf8
collation-server = utf8_general_ci

max_allowed_packet = 4M

query_cache_limit = 12M

long_query_time = 10
log-slow-queries = /var/log/mysql/log-slow-queries.log
log-queries-not-using-indexes

[mysqldump]
default-character-set = utf8

[mysql]
default-character-set = utf8
```

```
mkdir /var/log/mysql
touch /var/log/mysql/log-slow-queries.log
chown mysql.mysql -R /var/log/mysql
tail -f /var/log/mysql/log-slow-queries.log
```

### 시작
```
# chkconfig mysqld on
# service mysqld restart
# sudo systemctl restart mariadb
```

### CentOS 6.x 에서 nproc(Max User Processes) ###
```
# vi /etc/security/limits.conf

*                -       nproc           4095

# cat /proc/<mysql_pid>/limits
```

http://gywn.net/2012/10/mysql-connection-limitation-nproc/

### 계정 ###
```
# mysql -u root -p
mysql> select host, db, user from mysql.db;
mysql> select host, user, password from mysql.user;
mysql> set password for root@localhost=password('PASSWORD');
```

### root 계정 분실
```
# service mysqld stop
# mysqld_safe --user=root --skip-grant-tables &
# mysql

mysql> use mysql
mysql> update user set password=password('비밀번호') where user='root';
mysql> quit

# service mysqld restart
```

### 데이터 이전
```
# service mysqld stop

# mv /var/lib/mysql /data/database/mysql
# chown mysql.mysql -R /data/database/mysql

# /usr/bin/mysql_install_db --user=mysql --datadir=/data/database/mysql

# vi /etc/my.cnf

/var/lib/mysql -> /data/database/mysql

# vi /etc/init.d/mysqld

/var/lib/mysql -> /data/database/mysql

# service mysqld start
```

### 덤프
```
$ mysqldump -u[사용자아이디] -p[비밀번호] 데이터베이스명 > 덤프파일명

예) mysqldump -uUSERNAME -pPASSWORD mydatabase > mydatabase.sql
```

### 복구
```
$ mysql -u[사용자아이디] -p[비밀번호] 데이터베이스명 &lt; 덤프파일명

예) mysql -uUSERNAME -pPASSWORD mydatabase < mydatabase.sql
```

### Java UTF-8
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
    <entry key="driver">com.mysql.jdbc.Driver</entry>
    <entry key="url">jdbc:mysql://mysql-server/db-name?useUnicod=true&amp;characterEncoding=utf8</entry>
    <entry key="username">username</entry>
    <entry key="password">password</entry>
</properties>
```
