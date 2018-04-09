## ingress-nginx
```
ADDON=addons/.temp.yml
cp -rf addons/ingress-nginx.yml ${ADDON}

SSL_CERT_ARN=$(aws acm list-certificates | jq '.CertificateSummaryList[] | select(.DomainName=="nalbam.com")' | grep CertificateArn | cut -d '"' -f 4)

sed -i -e "s@{{SSL_CERT_ARN}}@${SSL_CERT_ARN}@g" "${ADDON}"

kubectl apply -f ${ADDON}

# ingress-nginx 에서 ELB Name 을 획득
ELB_NAME=$(kubectl get svc -n kube-ingress -owide | grep ingress-nginx | awk -F' ' '{print $4}' | cut -d '-' -f 1)

# ELB 에서 Hosted Zone ID, DNS Name 을 획득
ELB_ZONE_ID=$(aws elb describe-load-balancers --load-balancer-name ${ELB_NAME} | grep CanonicalHostedZoneNameID | cut -d '"' -f 4)
ELB_DNS_NAME=$(aws elb describe-load-balancers --load-balancer-name ${ELB_NAME} | grep '"DNSName"' | cut -d '"' -f 4)

# Route53 에서 해당 도메인의 Hosted Zone ID 를 획득
ZONE_ID=$(aws route53 list-hosted-zones | jq '.HostedZones[] | select(.Name=="nalbam.com.")' | grep '"Id"' | cut -d '"' -f 4 | cut -d '/' -f 3)

DOMAIN="sample-web.nalbam.com."

# temp file
RECORD=sample/.temp.json
cp -rf sample/record-sets.json ${RECORD}

# replace
sed -i -e "s@{{DOMAIN}}@${DOMAIN}@g" "${RECORD}"
sed -i -e "s@{{ELB_ZONE_ID}}@${ELB_ZONE_ID}@g" "${RECORD}"
sed -i -e "s@{{ELB_DNS_NAME}}@${ELB_DNS_NAME}@g" "${RECORD}"

# Route53 의 Record Set 에 입력/수정
aws route53 change-resource-record-sets --hosted-zone-id ${ZONE_ID} --change-batch file://./${RECORD}
```
 * https://github.com/kubernetes/ingress-nginx/
 * https://github.com/kubernetes/kops/tree/master/addons/ingress-nginx

## heapster
```
ADDON=addons/.temp.yml
cp -rf addons/heapster.yml ${ADDON}

kubectl apply -f ${ADDON}

watch kubectl top pod -n kube-system
watch kubectl top pod --all-namespaces
```
 * https://github.com/kubernetes/heapster/
 * https://github.com/kubernetes/kops/blob/master/docs/addons.md

## dashboard
```
ADDON=addons/.temp.yml
cp -rf addons/dashboard.yml ${ADDON}

SSL_CERT_ARN=$(aws acm list-certificates | jq '.CertificateSummaryList[] | select(.DomainName=="nalbam.com")' | grep CertificateArn | cut -d '"' -f 4)

sed -i -e "s@{{SSL_CERT_ARN}}@${SSL_CERT_ARN}@g" "${ADDON}"

kubectl apply -f ${ADDON}

kubectl get secret -n kube-system | grep dashboard
kubectl describe secret -n kube-system kubernetes-dashboard-token-xxxxx

kubectl proxy &

http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
```
 * https://github.com/kubernetes/dashboard/
 * https://github.com/kubernetes/kops/blob/master/docs/addons.md

## cluster-autoscaler
```
ADDON=addons/.temp.yml
cp -rf addons/cluster-autoscaler.yml ${ADDON}

CLOUD_PROVIDER=aws
IMAGE=k8s.gcr.io/cluster-autoscaler:v1.1.2
MIN_NODES=2
MAX_NODES=5
AWS_REGION=ap-northeast-2
GROUP_NAME="nodes.kube.nalbam.com"
SSL_CERT_PATH="/etc/ssl/certs/ca-certificates.crt"

sed -i -e "s@{{CLOUD_PROVIDER}}@${CLOUD_PROVIDER}@g" "${ADDON}"
sed -i -e "s@{{IMAGE}}@${IMAGE}@g" "${ADDON}"
sed -i -e "s@{{MIN_NODES}}@${MIN_NODES}@g" "${ADDON}"
sed -i -e "s@{{MAX_NODES}}@${MAX_NODES}@g" "${ADDON}"
sed -i -e "s@{{GROUP_NAME}}@${GROUP_NAME}@g" "${ADDON}"
sed -i -e "s@{{AWS_REGION}}@${AWS_REGION}@g" "${ADDON}"
sed -i -e "s@{{SSL_CERT_PATH}}@${SSL_CERT_PATH}@g" "${ADDON}"

kubectl apply -f ${ADDON}
```
 * https://github.com/kubernetes/autoscaler/
 * https://github.com/kubernetes/kops/tree/master/addons/cluster-autoscaler
