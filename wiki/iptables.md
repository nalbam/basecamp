### 설정 
```
iptables -F

iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT  -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP

iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -p tcp --dport 22    -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 25    -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 80    -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 443   -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 873   -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 3000  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 3306  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 3690  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 4440  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 4949  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 6379  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 8140  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 9200  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 25565 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 27017 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp -j DROP

service iptables save
iptables -L

service iptables restart
```

### 리셋 
```
iptables -F
service iptables save
iptables -L

service iptables restart
```

### Port Number (0~65536) 
```
20    FTP
21    FTP
22    SSH
23    Telnet
25    SMTP
37    RDATE
80    HTTP
110   POP3
389   LDAP
443   HTTPS
873   RSYNC
3306  Mysql
3690  SVN

2144  Hyperic Agent
4440  Rundeck
4949  MUNIN
6379  Radis
7001  Weblogic Server
7443  Hyperic Server SSL
8140  Puppet
9200  ElasticSearch
25565 Minecraft
27017 mongod
28017 mongod http
```
