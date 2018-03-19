```
rpm -Uvh http://yum.opennms.org/repofiles/opennms-repo-stable-rhel6.noarch.rpm

yum -y install opennms iplike

service postgresql initdb

vi /var/lib/pgsql/data/pg_hba.conf

# "local" is for Unix domain socket connections only
local   all         all                               trust
# IPv4 local connections:
host    all         all         127.0.0.1/32          trust
# IPv6 local connections:
host    all         all         ::1/128               trust

service postgresql start

/opt/opennms/bin/runjava -S /usr/java/default/bin/java

/opt/opennms/bin/install -dls

service opennms start

perl /opt/opennms/bin/send-event.pl --interface 1.234.27.75 uei.opennms.org/internal/discovery/newSuspect
perl /opt/opennms/bin/send-event.pl --interface 114.207.113.217 uei.opennms.org/internal/discovery/newSuspect
```
