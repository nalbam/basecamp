## 설치 

```
# yum -y install bind-*
```

## 설정 

```
# vi /etc/named.conf
```

```
	// allow-query     { localhost; };
	allow-query     { any; };

	empty-zones-enable no;
```
	
```
# vi /etc/named.rfc1912.zones
```

```
zone "91.52.117.in-addr.arpa" IN {
	type master;
	file "ns.nalbam.com.rev";
	allow-update { none; };
};

zone "nalbam.com" IN {
	type master;
	file "ns.nalbam.com.zone";
	allow-update { none; };
};
```

```
# vi /var/named/ns.nalbam.com.rev
```

```
$TTL 3h
@       IN      SOA     ns.nalbam.com. root.nalbam.com. (
                        2014010101      ; Serial
                        3h              ; Refresh after 3 hours
                        1h              ; Retry after 1 hours
                        1w              ; Expire after 1 week
                        1h              ; Negative caching TTL of 1 hour
)

        IN NS   ns.nalbam.com.
00      IN PTR  ns.nalbam.com.

```

```
# vi /var/named/ns.nalbam.com.zone
```

```
$TTL 3h
@       IN      SOA     ns.nalbam.com. root.nalbam.com. (
                        2014010101      ; Serial
                        3h              ; Refresh after 3 hours
                        1h              ; Retry after 1 hours
                        1w              ; Expire after 1 week
                        1h              ; Negative caching TTL of 1 hour
)

; Default Setting (NS, mail, A)
        IN      A       117.52.91.225
        IN      NS      ns.nalbam.com.
        IN      MX   1  aspmx.l.google.com.
        IN      MX   5  alt1.aspmx.l.google.com.
        IN      MX   5  alt2.aspmx.l.google.com.
        IN      MX  10  aspmx2.googlemail.com.
        IN      MX  10  aspmx3.googlemail.com.

; Nameservers (registered at InterNIC)
ns      IN      A       117.52.91.225

; Hosts Here - This is comments
blog    IN      A       117.52.91.225
files   IN      A       117.52.91.225
scv     IN      A       117.52.91.225
www     IN      A       117.52.91.225

mail    IN      CNAME   ghs.googlehosted.com.

; nalbam.com. IN TXT "v=spf1 ip4:117.52.91.225 ~all"
nalbam.com. IN TXT "v=spf1 a mx include:aspmx.googlemail.com include:_spf.google.com ~all"
```

## 체크 

```
# named-checkconf /etc/named.rfc1912.zones
# named-checkconf /etc/named.conf
# named-checkzone nalbam.com /var/named/ns.nalbam.com.zone
```

## 시작 

```
# service named restart
# chkconfig named on
```
