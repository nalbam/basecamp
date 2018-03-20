## prepare
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git curl wget zip docker.io golang-go
```

## Hangul
* http://hochulshin.com/ubuntu-1604-hangul/

## KVM
```
uname -m
egrep -c '(vmx|svm)' /proc/cpuinfo
egrep -c ' lm ' /proc/cpuinfo
kvm-ok

sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

sudo adduser `id -un` libvirtd
sudo adduser `id -un` kvm

sudo usermod -a -G libvirtd $(whoami)
newgrp libvirtd

virsh list --all

sudo ls -la /var/run/libvirt/libvirt-sock

ls -l /dev/kvm

sudo apt-get install virt-manager

sudo curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.7.0/docker-machine-driver-kvm -o /usr/local/bin/docker-machine-driver-kvm
sudo chmod +x /usr/local/bin/docker-machine-driver-kvm

sudo curl -L https://github.com/kubernetes/minikube/releases/download/v0.25.0/docker-machine-driver-kvm2 -o /usr/local/bin/docker-machine-driver-kvm2
sudo chmod +x /usr/local/bin/docker-machine-driver-kvm2
```
 * https://help.ubuntu.com/community/KVM/Installation
 * https://github.com/kubernetes/minikube/blob/master/docs/drivers.md

## docker-machine
```
curl -L https://github.com/docker/machine/releases/download/v0.14.0/docker-machine-`uname -s`-`uname -m` > /tmp/docker-machine
sudo install /tmp/docker-machine /usr/local/bin/docker-machine

docker-machine ls
```

## minishift
```
wget https://github.com/minishift/minishift/releases/download/v1.14.0/minishift-1.14.0-linux-amd64.tgz
tar zxvf minishift-1.14.0-linux-amd64.tgz
sudo mv minishift-1.14.0-linux-amd64/minishift /usr/local/bin/

minishift config set skip-check-kvm-driver true

minishift start
```
 * https://docs.openshift.org/latest/minishift/getting-started/quickstart.html
 * https://github.com/minishift/minishift/issues/2121

## spinnaker
```
DOCKER_IP=`docker-machine ip spinnaker` docker-compose up -d
```
 * https://github.com/spinnaker/spinnaker/tree/master/experimental/docker-compose

## skaffold
```
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && chmod +x skaffold && sudo mv skaffold /usr/local/bin
```
 * https://github.com/GoogleCloudPlatform/skaffold

