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

## aws ec2 fleet
```bash
FleetId=$(aws ec2 create-fleet --cli-input-json file://basecamp/aws/aws-ec2-fleet-create.json | grep FleetId | cut -d'"' -f4)

aws ec2 describe-fleets --fleet-id ${FleetId}

aws ec2 modify-fleet --fleet-id ${FleetId} --cli-input-json file://basecamp/aws/aws-ec2-fleet-modify.json

aws ec2 delete-fleets --fleet-id ${FleetId} --terminate-instances
```
* https://docs.aws.amazon.com/cli/latest/reference/ec2/create-fleet.html
* https://aws.amazon.com/ec2/pricing/on-demand/
