# awscli

## install

```bash
wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip

unzip -q awscli-bundle.zip

sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/bin/aws

sudo rm -rf /usr/local/bin/aws
sudo ln -s /usr/bin/aws /usr/local/bin/aws
```

## aws ec2 log

```bash
cat /var/log/cloud-init-output.log
```

## aws s3 sync

```bash
aws s3 sync /data/site/cdn.nalbam.com/ s3://cdn.nalbam.com/ --acl public-read
aws s3 sync s3://cdn.nalbam.com/ /data/site/cdn.nalbam.com/
```

## awscli v2

* <https://aws.amazon.com/blogs/developer/aws-cli-v2-development/>

```bash
pip install -e git://github.com/aws/aws-cli.git@v2#egg=awscli
```
