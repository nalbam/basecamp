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
sudo mkdir /data/work
sudo mkdir /data/work/nalbam

sudo chown -R ec2-user.ec2-user /data

cd /data/work/nalbam
git clone git@github.com:nalbam/nalbam-shell.git
ln -s /data/work/nalbam/nalbam-shell/linux/.nalbam ~/
```

### aws ssh 
```
ssh -i /Users/nalbam/Dropbox/keys/aws/nalbam-key.pem ec2-user@52.78.55.23
```

### aws cli 
```
aws configure

aws s3 sync /data/work/cdn.smartforge.kr/ s3://cdn.smartforge.kr/ --acl public-read
aws s3 sync s3://cdn.smartforge.kr/ /data/work/cdn.smartforge.kr/
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
