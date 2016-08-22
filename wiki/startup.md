### 런레벨
```
  * 런레벨
    * 0 - halt
    * 1 - Single user mode
    * 2 - Multi user mode, without NFS
    * 3 - Full muliuser mode
      * /etc/rc.d/init.d/rc3.d
    * 4 - unused
    * 5 - X11
      * /etc/rc.d/init.d/rc5.d
    * 6 - reboot
  * chkconfig: 345 90 20
    * 345 : 런레벨
    * 90 : booting 시  start, stop 순서
    * 20 : halt 시  start, stop 순서
```

### shell
```
# vi /etc/rc.d/init.d/myapp
```

```
#!/bin/bash
# chkconfig: 345 90 20

SHELL_HOME=/data/webapp/app/myapp

case "$1" in
start)
    $SHELL_HOME/bin/start-myapp.sh
;;
stop)
    $SHELL_HOME/bin/stop-myapp.sh
;;
restart)
    $0 stop
    $0 start
;;
*)
    echo "Usage : $0 {start|stop|restart}"
    exit 1
esac

exit 0

```

```
# chmod 755 /etc/rc.d/init.d/myapp
```

```
# service myapp start
# service myapp stop
# service myapp restart

# chkconfig myapp on
```

```
# cd /etc/rc.d/rc3.d/
# ll | grep myapp 
```
