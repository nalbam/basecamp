## install
```bash
sudo yum update -y
sudo yum install -y docker

sudo service docker start
sudo chkconfig docker on

wget $(curl -s https://api.github.com/repos/openshift/origin/releases/latest | grep browser_download_url | grep linux | grep server | cut -d '"' -f 4)
tar -xvzf openshift-origin-server-*-linux-64bit.tar.gz
sudo cp openshift-origin-server-*-linux-64bit/oc /usr/local/bin/

sudo vi /etc/sysconfig/docker
OPTIONS="--insecure-registry 172.30.0.0/16"

sudo service docker restart

sudo mount --make-shared /
sudo sed -i.bak -e \
 's:^\(\ \+\)"$unshare" -m -- nohup:\1"$unshare" -m --propagation shared -- nohup:' \
 /etc/init.d/docker

oc cluster up --routing-suffix=console.nalbam.com --public-hostname=console.nalbam.com
oc cluster up --routing-suffix=13.124.112.3.nip.io --public-hostname=13.124.112.3.nip.io

oc cluster down
```

## install with ansible
```bash
sudo yum update -y
sudo yum install -y git wget docker

sudo service docker start
sudo chkconfig docker on

sudo pip install -Iv ansible

git clone https://github.com/openshift/openshift-ansible.git

pushd openshift-ansible
git checkout release-3.7
popd

export DOMAIN=${DOMAIN:="$(curl ipinfo.io/ip).nip.io"}
export USERNAME=${USERNAME:="$(whoami)"}
export PASSWORD=${PASSWORD:=password}
export VERSION=${VERSION:="v3.7.1"}

export IP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"

ansible-playbook -i inventory.ini openshift-ansible/playbooks/byo/config.yml

htpasswd -b /etc/origin/master/htpasswd ${USERNAME} ${PASSWORD}
oc adm policy add-cluster-role-to-user cluster-admin ${USERNAME}
```

## minishift
```bash
wget $(curl -s https://api.github.com/repos/minishift/minishift/releases/latest | grep browser_download_url | grep linux | cut -d '"' -f 4)
tar zxvf minishift-*-linux-amd64.tgz
sudo mv minishift-*-linux-amd64/minishift /usr/local/bin/

minishift config set cpus 2
minishift config set memory 8GB
minishift config set metrics true
minishift config set skip-check-kvm-driver true

minishift start
minishift console

minishift addons enable xpaas

minishift ssh docker pull openshiftdemos/nexus:latest 
minishift ssh docker pull openshiftdemos/gogs:latest 
minishift ssh docker pull openshiftdemos/sonarqube:latest 
minishift ssh docker pull openshift/jenkins-2-centos7
minishift ssh docker pull openshift/jenkins-slave-maven-centos7

eval $(minishift oc-env)
eval $(minishift docker-env)

oc login -u system:admin

oc get all
```
 * https://docs.openshift.org/latest/minishift/getting-started/quickstart.html
 * https://github.com/minishift/minishift/issues/2121

## source-to-image
```bash
oc project openshift

oc import-image -n openshift openshift/redhat-openjdk-18:1.3 --from=registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift:latest --confirm
oc create -n openshift -f https://raw.githubusercontent.com/nalbam/openshift/master/openjdk18-basic-s2i.json

oc delete template/openjdk8-basic-s2i
```
 * https://github.com/openshift/source-to-image
 * https://github.com/openshift/source-to-image/blob/master/examples/nginx-centos7/README.md
 * https://github.com/openshift-s2i

## ci/cd
```bash
oc new-project ci
oc policy add-role-to-user admin developer -n ci

oc new-app -f https://raw.githubusercontent.com/OpenShiftDemos/nexus/master/nexus3-template.yaml \
           -p NEXUS_VERSION=latest \
           -p MAX_MEMORY=2Gi

GOGS_HOST="gogs-ci.$(oc get route nexus -o template --template='{{.spec.host}}' | sed "s/nexus-ci.//g")"
oc new-app -f https://raw.githubusercontent.com/OpenShiftDemos/gogs-openshift-docker/master/openshift/gogs-template.yaml \
           -p GOGS_VERSION=latest \
           -p HOSTNAME=${GOGS_HOST} \
           -p SKIP_TLS_VERIFY=true

oc new-app -f https://raw.githubusercontent.com/OpenShiftDemos/sonarqube-openshift-docker/master/sonarqube-template.yaml \
           -p SONARQUBE_VERSION=latest \
           -p SONAR_MAX_MEMORY=4Gi

echo $(curl --post302 http://${GOGS_HOST}/user/sign_up \
  --form user_name=gogs \
  --form password=gogs \
  --form retype=gogs \
  --form email=gogs@gogs.com)


```
