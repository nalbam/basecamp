
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

dn: ou=dev,dc=nalbam,dc=com
ou: dev
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

rootpw          {crypt}xxxxxxxxxx
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
