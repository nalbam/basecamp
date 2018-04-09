## 설치
```
sudo yum install -y munin-node munin
sudo yum install -y munin-node
```

## 모니터 유저
```
sudo htpasswd -c /etc/munin/munin-htpasswd username
```

## 서버 설정
```
sudo vi /etc/munin/munin.conf
```

```
contact.warmail.command php /data/webapp/shell/munin_noti.php "me@nalbam.com" "Munin warning [${var:host}] ${var:graph_title}" "warnings:  ${loop<,>:wfields ${var:label}=${var:value}}"
contact.warmail.always_send warning

contact.crimail.command php /data/webapp/shell/munin_noti.php "me@nalbam.com" "Munin critical [${var:host}] ${var:graph_title}" "criticals:  ${loop<,>:cfields ${var:label}=${var:value}}"
contact.crimail.always_send critical


[s1]
address 218.38.12.106
use_node_name yes

[s3]
address 114.207.113.217
use_node_name yes


# 1048576 1M

load.load.warning              3
load.load.critical             6

if_eth0.up.warning      20000000 #  30m
if_eth0.up.critical     30000000 #  30m

memory.swap.warning     50000000 # 100m
memory.swap.critical   100000000 # 100m

jmx_weblogic_memory.heap.Used.warning   600000000 # 768m
jmx_weblogic_memory.heap.Used.critical  768000000 # 768m

jmx_weblogic_memory.pool_PS_Perm_Gen.usage.Used.warning   200000000 # 256m
jmx_weblogic_memory.pool_PS_Perm_Gen.usage.Used.critical  256000000 # 256m
```

## 노드(클라이언트) 설정 - 서버지정
```
sudo vi /etc/munin/munin-node.conf
```
```
allow ^127\.0\.0\.1$
allow ^::1$
allow ^218\.38\.12\.106$
```

## 노드(클라이언트) 시작
```
sudo chkconfig munin-node on
sudo service munin-node start
```

## 로그
```
tail -f -n 300 /var/log/munin/munin-update.log
```

```
2009/10/14-17:35:01 CONNECT TCP Peer: "127.0.0.1:37109" Local: "127.0.0.1:4949"
2009/10/14-17:40:01 CONNECT TCP Peer: "127.0.0.1:57802" Local: "127.0.0.1:4949"
```

## 플러그인 사용
 * Apache
```
# ln -s /usr/share/munin/plugins/apache_accesses /etc/munin/plugins/
# ln -s /usr/share/munin/plugins/apache_processes /etc/munin/plugins/
# ln -s /usr/share/munin/plugins/apache_volume /etc/munin/plugins/
```

```
sudo vi /etc/httpd/conf/httpd.conf
```

```
ExtendedStatus On
```

```
sudo vi /etc/httpd/conf.d/vhost-localhost.conf
```

```
    <Location /server-status>
        SetHandler server-status
        Order deny,allow
        Deny  from all
    </Location>
```

 * Mysql
```
# ln -s /usr/share/munin/plugins/mysql_queries /etc/munin/plugins/
# ln -s /usr/share/munin/plugins/mysql_slowqueries /etc/munin/plugins/
# ln -s /usr/share/munin/plugins/mysql_threads /etc/munin/plugins/

sudo sudo vi /etc/munin/plugin-conf.d/munin-node
```

```
[mysql_*]
env.mysqlopts -u[username] -p[password]
```

 * Sendmail
```
sudo ln -s /usr/share/munin/plugins/sendmail_* /etc/munin/plugins/
```

 * JMX
```
ln -s /usr/share/munin/plugins/jmx_ /etc/munin/plugins/jmx_jira_MultigraphAll
ln -s /usr/share/munin/plugins/jmx_ /etc/munin/plugins/jmx_wiki_MultigraphAll

sudo vi /etc/munin/plugin-conf.d/munin-node
```

```
[jmx_jira_*]
env.ip   127.0.0.1
env.port 8082

[jmx_wiki_*]
env.ip   127.0.0.1
env.port 8092
```

 * Mongodb
```
git clone git@github.com:pcdummy/mongomon.git

cd mongomon
cp mongo* /usr/share/munin/plugins/

ln -s /usr/share/munin/plugins/mongo_* /etc/munin/plugins/

sudo vi /etc/munin/plugin-conf.d/munin-node
```

```
[mongo_*]
user nobody
env.HOST 127.0.0.1
env.PORT 27017
```

## 삭제 ##
```
sudo service munin-node stop

sudo yum -y erase munin munin-node

sudo rm -rf /etc/munin/
sudo rm -rf /var/log/munin/
sudo rm -rf /var/run/munin/
sudo rm -rf /var/www/html/munin/
```

  * http://munin-monitoring.org/
