### install
```
sudo yum install -y redis
```

```
sudo chkconfig redis on
sudo service redis restart
```

### conf
```
sudo vi /etc/redis.conf
```
```
bind 127.0.0.1
bind 114.207.113.217

requirepass password
```

### remove
```
redis-cli -a "ya1234" keys "*" | xargs /redis-cli -a "ya1234" del
```

 * http://redis.io/
