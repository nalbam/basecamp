### 서버 정보
```
# cat /proc/cpuinfo
# cat /proc/meminfo
```

### 설치 버전
```
# uname -a
```

### 시간 싱크
```
# crontab -e

0 0 * * * /usr/bin/rdate -s time.bora.net
```

### 터미널 언어
```
# vi /etc/sysconfig/i18n

LANG="en_US.UTF-8"
SYSFONT="latarcyrheb-sun16"

# source /etc/sysconfig/i18n
```

### sudo 권한
```
# vi /etc/sudoers

nalbam  ALL=(ALL)   ALL
```

### root 로그인 금지
```
# vi /etc/ssh/sshd_config

#PermitRootLogin yes
-->
PermitRootLogin no

# service sshd restart
```

### hostname 변경

### centos 6
```
# cat /etc/sysconfig/network | grep HOSTNAME
# vi /etc/sysconfig/network

HOSTNAME=s1
```

### centos 7
```
# hostnamectl set-hostname s1
# hostname
```

### swap 사용율 변경
```
# vi /etc/sysctl.conf

vm.swappiness=10

```
