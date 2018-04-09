## install
```
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
