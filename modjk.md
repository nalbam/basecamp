### install ###
```
sudo yum install autoconf libtool

cd /data/pds/tomcat-connectors-1.2.41-src/native/
./buildconf.sh
./configure --with-apxs=/usr/bin/apxs
make
make install
```

### conf
```
# vi /etc/httpd/conf.d/modjk.conf

LoadModule  jk_module  modules/mod_jk.so

<ifModule jk_module>
    JkWorkersFile conf.d/workers.properties

    JkLogFile "|/usr/sbin/rotatelogs /data/log/modjk/%Y.%m.%d.modjk.log 86400 +540"
#   JkLogLevel error
#   JkLogStampFormat "[%Y %a %b %d %H:%M:%S]"
    JkShmFile /data/logs/mod-jk.shm
</IfModule>
```

### workers
```
# vi /etc/httpd/conf.d/workers.properties

# workers.properties

worker.list=ajp00,ajp01,ajp02,ajp03,ajplb

worker.ajp00.type=ajp13
worker.ajp00.host=localhost
worker.ajp00.port=8100

worker.ajp01.type=ajp13
worker.ajp01.host=localhost
worker.ajp01.port=8101

worker.ajp02.type=ajp13
worker.ajp02.host=localhost
worker.ajp02.port=8102

worker.ajp03.type=ajp13
worker.ajp03.host=localhost
worker.ajp03.port=8103

worker.ajplb.type=lb
worker.ajplb.balance_workers=ajp01,ajp02
worker.ajplb.sticky_session=1
```

```
# vi /etc/httpd/conf.d/vhost-smartforge-wiki.conf

<ifModule jk_module>
    JkMount  /*  ajplb
</IfModule>
```

```
# vi /data/webapp/app/wiki/conf/server.xml

<Connector port="8081" redirectPort="8443" enableLookups="false" protocol="AJP/1.3" URIEncoding="UTF-8"/>
```

```
$ strings /etc/httpd/modules/mod_jk.so | grep mod_jk/

mod_jk/1.2.40
```

 * http://tomcat.apache.org/download-connectors.cgi
