## install
```
sudo yum update -y
sudo yum install -y docker python-rhsm-certificates

sudo systemctl start docker
sudo systemctl enable docker

wget $(curl -s https://api.github.com/repos/openshift/origin/releases/latest | grep browser_download_url | grep linux | grep server | cut -d '"' -f 4)
tar -xvzf openshift-origin-server-*-linux-64bit.tar.gz
pushd openshift-origin-server-*-linux-64bit
sudo cp -rf hyperkube kubectl oadm oc openshift /usr/local/bin/
popd

sudo vi /etc/sysconfig/docker
INSECURE_REGISTRY='--insecure-registry 172.30.0.0/16'

sudo systemctl daemon-reload
sudo systemctl restart docker

sudo docker network inspect -f "{{range .IPAM.Config }}{{ .Subnet }}{{end}}" bridge

oc cluster up --public-hostname=console.nalbam.com --routing-suffix=apps.nalbam.com

oc cluster down
```
 * https://github.com/openshift/origin/blob/master/docs/cluster_up_down.md
 * https://docs.openshift.org/latest/getting_started/administrators.html

## source-to-image
```
oc project openshift

oc import-image -n openshift openshift/redhat-openjdk-18:1.3 --from=registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift:latest --confirm
oc create -n openshift -f https://raw.githubusercontent.com/nalbam/openshift/master/openjdk18-basic-s2i.json

oc delete template/openjdk8-basic-s2i
```
 * https://github.com/openshift/source-to-image
 * https://github.com/openshift/source-to-image/blob/master/examples/nginx-centos7/README.md
 * https://github.com/openshift-s2i

## import image
```
oc import-image -n openshift openshift/sample-web:latest --from=docker.io/nalbam/sample-web:latest --confirm
```

## ci/cd
```
oc new-project ci
oc policy add-role-to-user admin developer -n ci

oc new-app -f https://raw.githubusercontent.com/OpenShiftDemos/nexus/master/nexus3-template.yaml \
           -p NEXUS_VERSION=3.9.0 \
           -p MAX_MEMORY=2Gi

GOGS_HOST="gogs-ci.$(oc get route nexus -o template --template='{{.spec.host}}' | sed "s/nexus-ci.//g")"
oc new-app -f https://raw.githubusercontent.com/OpenShiftDemos/gogs-openshift-docker/master/openshift/gogs-template.yaml \
           -p GOGS_VERSION=0.11.43 \
           -p HOSTNAME=${GOGS_HOST} \
           -p SKIP_TLS_VERIFY=true

oc new-app -f https://raw.githubusercontent.com/OpenShiftDemos/sonarqube-openshift-docker/master/sonarqube-template.yaml \
           -p SONARQUBE_VERSION=6.7.2 \
           -p SONAR_MAX_MEMORY=4Gi

echo $(curl --post302 http://${GOGS_HOST}/user/sign_up \
  --form user_name=gogs \
  --form password=gogs \
  --form retype=gogs \
  --form email=gogs@gogs.com)
```
