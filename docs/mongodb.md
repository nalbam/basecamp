## 다운로드 및 설치
```
# vi /etc/yum.repos.d/mongodb.repo

[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1

# yum -y install mongodb-org mongodb-org-server mongodb-org-shell mongodb-org-mongos mongodb-org-tools
```

## 시작
```
chkconfig mongod on
service mongod restart
```

## 설정
```
vi /etc/mongod.conf

# Listen to local interface only. Comment out to listen on all interfaces.
bind_ip=127.0.0.1,114.207.113.217,59.6.152.75

# Turn on/off security.  Off is currently the default
auth=true
```

## 데이터
```
cd /var/lib/mongo
```

## 로그
```
tail -f /var/log/mongodb/mongod.log
```

## 테스트
```
# mongo

> db.test.save( { a: 1 } )
> db.test.find()

> use admin

> db.dropUser("admin")
> db.createUser({ user: "admin", pwd: "yt1234", roles: [{role: "userAdminAnyDatabase", db: "admin"}]})
> db.getUsers()

```

## php
```
pecl install mongo

php -i | grep "mongo"
php --re mongo
```

 * http://www.mongodb.org
 * http://docs.mongodb.org/manual/tutorial/install-mongodb-on-red-hat/
 * http://docs.mongodb.org/manual/reference/default-mongodb-port/
