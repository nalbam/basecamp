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

worker.list=ajpjira,ajpwiki

worker.ajpjira.type=ajp13
worker.ajpjira.host=localhost
worker.ajpjira.port=8081

worker.ajpwiki.type=ajp13
worker.ajpwiki.host=localhost
worker.ajpwiki.port=8091
```

```
# vi /etc/httpd/conf.d/vhost-smartforge-jira.conf

<ifModule jk_module>
    JkMount  /*  ajpjira
</IfModule>
```

```
# vi /data/webapp/app/jira/conf/server.xml

<Connector port="8081" redirectPort="8443" enableLookups="false" protocol="AJP/1.3" URIEncoding="UTF-8"/>
```

```
$ strings /etc/httpd/modules/mod_jk.so | grep mod_jk/

mod_jk/1.2.40
```

 * http://tomcat.apache.org/download-connectors.cgi
