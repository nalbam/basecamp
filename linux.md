### 서버 정보
```
cat /proc/cpuinfo
cat /proc/meminfo
```

### 설치 버전
```
uname -a
```

### 시간 싱크
```
crontab -e

0 0 * * * /usr/bin/rdate -s time.bora.net
```

### 터미널 언어
```
vi /etc/sysconfig/i18n

LANG="en_US.UTF-8"
SYSFONT="latarcyrheb-sun16"

source /etc/sysconfig/i18n
```

### sudo 권한
```
sudo usermod -aG wheel $USER

vi /etc/sudoers

%wheel	ALL=(ALL)	ALL
%wheel	ALL=(ALL)	NOPASSWD: ALL
```

### root 로그인 금지
```
vi /etc/ssh/sshd_config

PermitRootLogin without-password
PasswordAuthentication yes

service sshd restart
```

### hostname 변경
 * centos 6
```
cat /etc/sysconfig/network | grep HOSTNAME
sudo vi /etc/sysconfig/network

HOSTNAME=s1
```
 * centos 7
```
sudo hostnamectl set-hostname s1
hostname
```

### startup
```
cd /usr/local/
cd /etc/rc.d/init.d/
cd /etc/systemd/system/
```

### Network
```
sudo nmcli d
sudo nmtui
sudo ip addr
sudo netstat -tnlp
```

### Desktop
```
sudo yum -y groupinstall "GNOME Desktop" "Graphical Administration Tools"

sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
```
