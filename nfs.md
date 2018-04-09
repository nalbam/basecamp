## 설치 
```
# yum -y install rpcbind nfs-utils
```

## 설정 
```
# vi /etc/exports
```

```
/data/userfile *(rw,sync,no_root_squash,no_all_squash)
```

## 시작 
```
# service nfs restart
# service nfslock restart
# service rpcbind restart
```

## 확인 
```
# rpcinfo -p
```

## 포트 
```
# vi /etc/sysconfig/nfs

LOCKD_TCPPORT=32803
LOCKD_UDPPORT=32769
MOUNTD_PORT=892
RQUOTAD_PORT=875
STATD_PORT=662
STATD_OUTGOING_PORT=2020
```

## 포트열기 
```
# vi /etc/sysconfig/iptables
```

```
iptables -A INPUT -m state --state NEW -p udp --dport 111 -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp --dport 111 -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp --dport 2049 -j ACCEPT
iptables -A INPUT -m state --state NEW -p udp --dport 32769 -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp --dport 32803 -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp --dport 662 -j ACCEPT
iptables -A INPUT -m state --state NEW -p udp --dport 662 -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp --dport 892 -j ACCEPT
iptables -A INPUT -m state --state NEW -p udp --dport 892 -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp --dport 875 -j ACCEPT
iptables -A INPUT -m state --state NEW -p udp --dport 875 -j ACCEPT
```

```
# service iptables restart
```

## 재시작 
```
# service nfs restart
# service nfslock restart
# service rpcbind restart
```

## 마운트 
```
# mount -t nfs 114.207.113.217:/data/userfile  /data/userfile  -o nolock
```

## 확인 
```
# df -h
```

```
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1             902G   75G  781G   9% /
tmpfs                 3.8G     0  3.8G   0% /dev/shm
1.234.27.75:/data/webapp/spickr/static
                      902G  176G  680G  21% /data/nfs/spickr/static
```

## 부팅시 시작 
```
# chkconfig nfs on
# chkconfig nfslock on
# chkconfig rpcbind on
```

## 부팅시 마운드 
```
# vi /etc/fstab
```

```
...
127.0.0.1:/home/nalbam/01      /home/nalbam/nfs/01       nfs   defaults   0 0
127.0.0.1:/home/byforce/01     /home/byforce/nfs/01      nfs   bg,soft,rw 0 0

175.126.74.76:/data/webfiles/spickr/files    /data/webfiles/spickr/files    nfs   bg,soft,rw   0 0

호스트명(ip주소):/공유디렉토리   /마운트포인트   nfs(파일시스템)   옵션   덤프   점검여부
```
