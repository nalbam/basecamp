### install
```
yum -y --enablerepo=remi install redis
```

```
chkconfig redis on
service redis restart
```

### conf
```
vi /etc/redis.conf

bind 127.0.0.1
bind 114.207.113.217

requirepass ya1234
```

### remove
```
redis-cli -a "ya1234" keys "*" | xargs /redis-cli -a "ya1234" del
```

 * http://redis.io/
