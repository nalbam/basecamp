
### install 
```
sudo yum install -y openldap openldap-servers openldap-clients
```

### root password
```
slappasswd -s <password>
```

### base.ldif
```
vi /root/base.ldif
```
```
dn: dc=nalbam,dc=com
dc: nalbam
objectClass: top
objectClass: domain

dn: ou=People,dc=nalbam,dc=com
ou: People
objectClass: top
objectClass: organizationalUnit

dn: ou=Group,dc=nalbam,dc=com
ou: Group
objectClass: top
objectClass: organizationalUnit

```

### slapd.conf
```
cp /usr/share/openldap-servers/slapd.conf.obsolete /etc/openldap/slapd.conf

vi /etc/openldap/slapd.conf
```
```
#######################################################################
# database definitions
#######################################################################

database        bdb
suffix          "dc=nalbam,dc=com"
checkpoint      1024 15
rootdn          "cn=Manager,dc=nalbam,dc=com"

rootpw          {crypt}xxxxxxxx
```

### config
```
rm -rf /etc/openldap/slapd.d/*

cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG

slapadd -v -l /root/base.ldif

slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d

chown ldap.ldap -Rf /etc/openldap/slapd.d/*
chown ldap.ldap -Rf /var/lib/ldap/*
```

### start
```
service slapd start
chkconfig slapd on
```

### test
```
ldapsearch -x -d 1
ldapsearch -x -b dc=nalbam,dc=com
```

### add user
```
vi user.ldif
```
```
dn: uid=test,ou=dev,dc=nalbam,dc=com
cn: test
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
objectClass: top
uidNumber: 500
gidNumber: 500
homeDirectory: /home/test
loginShell: /bin/bash
shadowLastChange: 11192
shadowMin: -1
shadowMax: 99999
shadowWarning: 7
shadowInactive: -1
shadowExpire: -1
shadowFlag: 134538308
uid: nalbam
userPassword: {SSHA}xxxxxxxx
```
```
ldapadd -x -D 'cn=Manager,dc=nalbam,dc=com' -W -f user.ldif
```

### add group
```
vi group.ldif
```
```
dn: cn=test,ou=dev,dc=nalbam,dc=com
cn: test
objectclass: posixGroup
objectclass: top
gidNumber: 500
memberUid: test
```
```
ldapadd -x -D 'cn=Manager,dc=nalbam,dc=com' -W -f group.ldif
```
