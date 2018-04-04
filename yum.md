## CentOS
```
yum -y groupinstall "Development Tools"
yum -y groupinstall "Server Platform Development"
```

## CentOS/RHEL 7
```
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
```

## CentOS/RHEL 6
```
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
```

## List
```
yum list
```

## Clean
```
yum clean all
```
