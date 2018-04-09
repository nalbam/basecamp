## tar 
```
URL5=http://download.oracle.com/otn-pub/java/jdk/8u101-b13/server-jre-8u101-linux-x64.tar.gz

wget -q -N --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" ${URL5}

tar xzf server-jre-8u101-linux-x64.tar.gz

sudo mv jdk1.8.0_101 /usr/local/

sudo ln -s /usr/local/jdk1.8.0_101/bin/java /usr/bin/java
sudo ln -s /usr/local/jdk1.8.0_101/bin/javac /usr/bin/javac
sudo ln -s /usr/local/jdk1.8.0_101/bin/jar /usr/bin/jar
```

## rpm 
```
# rpm -ivh --force jdk-8u101-linux-x64.rpm

/usr/java/jdk1.8.0_101
```

## JAVA_HOME 
```
# vi /etc/profile

export JAVA_HOME="/usr/local/jdk1.8.0_101"

PATH=$JAVA_HOME/bin:$PATH
```

## security
```
sudo cp -rf local_policy.jar.bin /usr/local/jdk1.8.0_101/jre/lib/security/
sudo cp -rf US_export_policy.jar.bin /usr/local/jdk1.8.0_101/jre/lib/security/
```

## mac path 
```
/Library/Java/JavaVirtualMachines/jdk1.8/Contents/Home
/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home
/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
```
