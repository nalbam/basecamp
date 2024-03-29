# awscli

## aws init log

```bash
cat /var/log/cloud-init-output.log
```

## aws ec2 ami

```bash
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.nano" \
    | jq '.Reservations[].Instances[] | {Id:.InstanceId,Type:.InstanceType,State:.State.Name,Tags:.Tags}'

aws ec2 create-image --instance-id i-0f5da04c56afc315f \
    --name "SEOUL-A-SRE-K8S-BASTION-20190101" \
    --description "SEOUL-A-SRE-K8S-BASTION-20190101" \
    --block-device-mappings "[{\"DeviceName\": \"/dev/xvda\",\"Ebs\":{\"VolumeSize\":10}}]"

aws ec2 describe-images --owner "self" --filters "Name=name,Values=*-BASTION-*" \
    | jq '.Images[] | {Id:.ImageId,Name:.Name}'
```

## aws ec2 tag

```bash
CLUSTER_NAME="eks-demo"

aws ec2 describe-instances --filters "Name=tag:KubernetesCluster,Values=$CLUSTER_NAME" \
  --query "Reservations[].Instances[].InstanceId" | jq '.[]' -r

aws ec2 create-tags \
    --resources i-0a780c6f743f4bad1 --tags Key=aws-node-termination-handler/${CLUSTER_NAME},Value=true
```

## aws s3 sync

```bash
aws s3 sync /Volumes/RETROPIE/roms/ s3://roms.nalbam.com/ --acl public-read
aws s3 sync s3://cdn.nalbam.com/ /data/site/cdn.nalbam.com/
```

## aws ce

```bash
# get-tags
aws ce get-tags --time-period Start=2019-04-01,End=2019-05-01
aws ce get-tags --time-period Start=2019-04-01,End=2019-05-01 --tag-key KubernetesCluster

    # --time-period Start=2019-03-01,End=2019-05-01 \
    # --granularity MONTHLY \
    # --granularity DAILY \
    # --metrics "UnblendedCost" \
    # --group-by Type=DIMENSION,Key=SERVICE \
    # --filter file:///tmp/filters.json \

cat <<EOF > /tmp/filters.json
{
    "Dimensions": {
        "Key": "SERVICE", "Values": ["Amazon Elastic Container Service for Kubernetes"]
    }
}
EOF

cat <<EOF > /tmp/filters.json
{
    "Tags": {
        "Key": "KubernetesCluster", "Values": ["seoul-dev-spot-eks"]
    }
}
EOF

# get-cost-and-usage MONTHLY
aws ce get-cost-and-usage \
    --time-period Start=2019-03-01,End=2019-05-01 \
    --granularity MONTHLY \
    --metrics "UnblendedCost" \
    --filter file:///tmp/filters.json \
    | jq '.'

# get-cost-and-usage DAILY
aws ce get-cost-and-usage \
    --time-period Start=2019-04-07,End=2019-04-10 \
    --granularity DAILY \
    --metrics "UnblendedCost" \
    --filter file:///tmp/filters.json \
    | jq '.'
```

## awscli v2

* <https://aws.amazon.com/blogs/developer/aws-cli-v2-development/>

```bash
pip install -e git://github.com/aws/aws-cli.git@v2#egg=awscli
```
