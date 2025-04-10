## Deploy 
```
cd /data/webapp/app

wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war

t 00 init
t 00 deploy jenkins
```

## Plugin 
```
Blue Ocean beta
Maven Integration plugin
GitHub Authentication plugin

Checkstyle Plug-in
Cobertura Plugin
DRY Plug-in
FindBugs Plug-in
PMD Plug-in
Task Scanner Plug-in

Slack Notification Plugin

Android Emulator Plugin
Environment Injector Plugin
```

## backup from kubernetes
```
export NAMESPACE=default
export JENKINS_POD=$(kubectl get pods -n $NAMESPACE | grep jenkins | awk '{print $1}')

mkdir -p docker/jenkins

kubectl cp ${NAMESPACE}/${JENKINS_POD}:var/jenkins_home/config.xml   docker/jenkins/config.xml
kubectl cp ${NAMESPACE}/${JENKINS_POD}:var/jenkins_home/users/   docker/jenkins/users/
kubectl cp ${NAMESPACE}/${JENKINS_POD}:var/jenkins_home/jobs/   docker/jenkins/jobs/
kubectl cp ${NAMESPACE}/${JENKINS_POD}:var/jenkins_home/secrets/master.key   docker/jenkins/secrets/master.key
kubectl cp ${NAMESPACE}/${JENKINS_POD}:var/jenkins_home/secrets/hudson.util.Secret   docker/jenkins/secrets/hudson.util.Secret
kubectl cp ${NAMESPACE}/${JENKINS_POD}:var/jenkins_home/secrets/slave-to-master-security-kill-switch   docker/jenkins/secrets/slave-to-master-security-kill-switch

curl -sSL "http://admin:password@10.106.225.149:8080/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | \
  perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'|sed 's/ /:/' > \
  docker/jenkins/plugins.txt 
```
