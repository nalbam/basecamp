### 설치
```
# yum -y install sendmail sendmail-cf
```

### 릴레이
```
# vi /etc/mail/access
```
```
spic.kr     RELAY
spic.me     RELAY
nalbam.com  RELAY
```

### 최종 수신자
```
# vi /etc/mail/local-host-names
```
```
spic.kr
spic.me
nalbam.com
```

### spickr 계정
```
# vi /etc/aliases
```
```
spickr:     |/data/webapp/spickr/shell/mail.save.php
```

### sendmail 설정
```
# vi /etc/mail/sendmail.mc
```
```
TRUST_AUTH_MECH(`EXTERNAL DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
define(`confAUTH_MECHANISMS', `EXTERNAL GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl

FEATURE(`mailertable',`hash -o /etc/mail/mailertable.db')dnl
FEATURE(`virtusertable',`hash -o /etc/mail/virtusertable.db')dnl

DAEMON_OPTIONS(`Port=smtp, Name=MTA')dnl

MASQUERADE_AS(`nalbam.com')dnl

FEATURE(masquerade_envelope)dnl
```

### sendmail 적용
```
# m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf
# service sendmail restart
# service saslauthd restart
```

### 모든 spic.kr 로 들어온 메일을 spickr 계정으로 전송
```
# vi /etc/mail/virtusertable
```

```
@spic.kr  spickr@spic.me
```

### 재시작
```
# service sendmail restart
```

### 자동시작
```
# chkconfig sendmail on
# chkconfig saslauthd on
```

### send
```
telnet nalbam.com 25

mail from:mon@nalbam.com
rcpt to:byforce@gmail.com
data
subject: hi!
yo
.
```

### sendmail 에서 php 실행에 문제가 발생 했다면
```
# ln -s /usr/bin/php /etc/smrsh/php
# ln -s /data/webapp/spickr/shell/mail.save.php /etc/smrsh/mail.save.php
```

### daemon MTA: cannot bind: Address already in use
```
# service postfix stop
# chkconfig postfix off
```

### php 파싱
```
#!/usr/local/bin/php
<?php
$fp = fopen("php://stdin","r");
while(!feof($fp)) {
	$line = fgets($fp, 1024);
	// 파싱..
}
fclose($fp);
?>
```
