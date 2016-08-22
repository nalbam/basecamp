### mirrors 
```
http://ftp.daum.net/cygwin/
ftp://ftp.kaist.ac.kr/cygwin/
ftp://ftp.sayclub.com/pub/cygwin/
```

### apt-cyg 
```
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin

apt-cyg install wget vim git curl figlet
```

### passwd 
```
mkpasswd -l -d -p "$(cygpath -H)" > /etc/passwd
mkgroup -l -d > /etc/group
```

 * https://www.cygwin.com/
 * https://github.com/transcode-open/apt-cyg
 * http://blog.kusweet.com/cygwin-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0/
