### 설치
```
# yum -y install xinetd rsync
```

```
# vi /etc/xinetd.d/rsync
```

```
# default: off
# description: The rsync server is a good addition to an ftp server, as it \
#   allows crc checksumming etc.
service rsync
{
    disable         = no
    socket_type     = stream
    wait            = no
    user            = root
    server          = /usr/bin/rsync
    server_args     = --daemon
    log_on_failure  += USERID
}
```

### 시작 ###
```
# chkconfig xinetd on
# service xinetd restart
```

### 확인 ###
```
port : 873
```

### 서버 설정 ###
```
# vi /etc/rsyncd.conf
```

```
[data-shell]
path = /data/shell
comment = smartforge shell
uid = nobody
gid = nobody
use chroot = yes
read only = yes
host allow = 1.234.20, 175.126.74.94, 175.118.124.108
max connection = 5
timeout 300

[data-webapp]
path = /data/webapp
comment = smartforge webapp
uid = nobody
gid = nobody
use chroot = yes
read only = yes
host allow = 1.234.20, 175.126.74.94, 175.118.124.108
max connection = 5
timeout 300
```

```
[name]
path : 공유할 디렉토리
comment : 설명
uid : 접근할 user id
gid : 접근할 group id
use chroot : chroot를 사용할지 여부, 특별한 이유가 없는 이상 꼭 사용할 것
read only : 읽기만 가능할 것인지, 백업의 피 대상이므로 yes로 설정
host allow : 접근 가능한 호스트 설정. 백업서버만 접근 가능하도록 설정
max connection : 최대 몇개의 커넥션을 연결할 수 있는지 설정
timeout : 타임아웃 시간 설정
```

### 클라이언트
```
rsync -av s3:/data/shell/ /backup/shell/
rsync -av --delete --exclude=*.txt --bwlimit=1024 s3:/data/webapp/spickr/ /backup/webapp/spickr/

rsync -av --bwlimit=2048 s3:/backup/data/userfile/spickr/ /backup/data/userfile/spickr/

rsync -av s1.nalbam.com:/home/pi/RetroPie/roms/ /home/pi/RetroPie/roms/

rsync -av /Users/nalbam/Downloads/roms/ pi@192.168.150.158:/home/pi/RetroPie/roms/
rsync -av pi@192.168.150.158:/home/pi/RetroPie/roms/ /Users/nalbam/Downloads/roms/
```
