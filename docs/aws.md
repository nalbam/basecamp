## setup
```
sudo passwd
sudo passwd ec2-user

sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

sudo yum update -y
sudo yum install -y git vim wget zsh

sudo mkdir /data
sudo mkdir /data/apps
sudo mkdir /data/logs
sudo mkdir /data/site

sudo chown -R ec2-user.ec2-user /data
```

## eb log
```
cat /var/log/eb-activity.log
tail -f -n 1000 /var/log/eb-activity.log
```

## awslogs
```
sudo yum install -y awslogs

sudo vi /etc/awslogs/awscli.conf

region = ap-northeast-2
aws_access_key_id = <YOUR ACCESS KEY>
aws_secret_access_key = <YOUR SECRET KEY>

sudo service awslogs start
sudo chkconfig awslogs on
```
