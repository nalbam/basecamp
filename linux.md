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
nalbam  ALL=(ALL)   NOPASSWD: ALL
```

### root 로그인 금지
```
# vi /etc/ssh/sshd_config

PermitRootLogin without-password
PasswordAuthentication yes

# service sshd restart
```

### hostname 변경

  * centos 6
```
# cat /etc/sysconfig/network | grep HOSTNAME
# vi /etc/sysconfig/network

HOSTNAME=s1
```

  * centos 7
```
# hostnamectl set-hostname s1
# hostname
```

### Network
```
# nmcli d
# nmtui
# ip addr
```

### Desktop
```
# yum -y groupinstall "GNOME Desktop" "Graphical Administration Tools"

# ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
```
