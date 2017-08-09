### setup
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

### aws ssh
```
ssh -i /Users/nalbam/Dropbox/keys/aws/nalbam-key.pem ec2-user@11.22.33.44
```

### aws cli
```
aws configure

aws s3 sync /data/site/cdn.nalbam.com/ s3://cdn.nalbam.com/ --acl public-read
aws s3 sync s3://cdn.nalbam.com/ /data/site/cdn.nalbam.com/
```

### log
```
cat /var/log/eb-activity.log
```

### awslog
```
sudo yum install -y awslogs

sudo vi /etc/awslogs/awscli.conf

region = ap-northeast-2
aws_access_key_id = <YOUR ACCESS KEY>
aws_secret_access_key = <YOUR SECRET KEY>

sudo service awslogs start
sudo chkconfig awslogs on
```
