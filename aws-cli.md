# awscli

## aws init log

```bash
cat /var/log/cloud-init-output.log
```

## aws ec2 ami

```bash
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.nano" | \
    jq '.Reservations[].Instances[] | {Id:.InstanceId,Type:.InstanceType,State:.State.Name,Tags:.Tags}'

aws ec2 create-image --instance-id i-0f5da04c56afc315f \
    --name "SEOUL-A-SRE-K8S-BASTION-20190101" \
    --description "SEOUL-A-SRE-K8S-BASTION-20190101" \
    --block-device-mappings "[{\"DeviceName\": \"/dev/xvda\",\"Ebs\":{\"VolumeSize\":10}}]"

aws ec2 describe-images --owner "self" --filters "Name=name,Values=*-BASTION-*" | \
    jq '.Images[] | {Id:.ImageId,Name:.Name}'
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
