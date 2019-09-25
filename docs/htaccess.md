## 암호생성 
```
htpasswd -c /data/passwd/.byforce byforce
```

## 설정 
```
vi /etc/httpd/conf.d/vhost-smileforge-wiki.conf
```

```
    <Directory /data/webapp/smartforge/wiki>
        Options FollowSymLinks
        AllowOverride All
        Order deny,allow
        Allow from all
        DirectoryIndex index.html index.php

        AuthName smileforge
        AuthType Basic
        AuthUserFile /data/passwd/.byforce
        Require valid-user
    </Directory>
```

## 재시작 
```
service httpd restart
```
