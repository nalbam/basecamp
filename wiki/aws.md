### setup 
```
sudo passwd
sudo passwd ec2-user

sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

sudo yum update -y
sudo yum install -y git vim wget zsh

sudo mkdir /data
sudo mkdir /data/apps
sudo mkdir /data/webapp
sudo mkdir /data/webapp/app
sudo mkdir /data/work
sudo mkdir /data/work/nalbam

sudo chown -R ec2-user.ec2-user /data

cd /data/work/nalbam
git clone git@github.com:nalbam/nalbam-shell.git
ln -s /data/work/nalbam/nalbam-shell/linux/.nalbam ~/

sudo yum install -y java-1.8.0-openjdk
sudo yum remove -y java-1.7.0-openjdk

cd /data/work/nalbam
y nalbam-cjart cl
y nalbam-config cl
y nalbam-gift cl
y nalbam-kiosk cl
y nalbam-saymoji cl
y nalbam-smartforge cl
y nalbam-spickr cl
y nalbam-webapp cl
```

### aws ssh 
```
ssh -i /Users/nalbam/Dropbox/keys/aws/nalbam-key.pem ec2-user@52.78.55.105
```

### aws cli 
```
aws configure

aws s3 sync /data/work/smartforge/src/main/webapp/s/ s3://s.smartforge.kr/ --acl public-read
aws s3 sync /data/work/nalbam/src/main/webapp/s/ s3://s.nalbam.com/ --acl public-read
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
