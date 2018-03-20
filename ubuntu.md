## prepare
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git curl wget zip sudo apt-get update
```

## Hangul
* http://hochulshin.com/ubuntu-1604-hangul/

## KVM
```
egrep -c '(vmx|svm)' /proc/cpuinfo
egrep -c ' lm ' /proc/cpuinfo
kvm-ok
uname -m

sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

sudo adduser `id -un` libvirtd
sudo adduser `id -un` kvm

virsh list --all

sudo ls -la /var/run/libvirt/libvirt-sock

ls -l /dev/kvm

sudo apt-get install virt-manager

sudo curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.7.0/docker-machine-driver-kvm -o /usr/local/bin/docker-machine-driver-kvm
sudo chmod +x /usr/local/bin/docker-machine-driver-kvm
```
 * https://help.ubuntu.com/community/KVM/Installation

## kubectl
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```
 * https://kubernetes.io/docs/tasks/tools/install-kubectl/

## minikube
```
https://github.com/kubernetes/minikube/releases/download/v0.25.0/docker-machine-driver-kvm2

curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.25.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
```
 * https://kubernetes.io/docs/tasks/tools/install-minikube/

## minishift
```
minishift config set skip-check-kvm-driver true

minishift start
```
 * https://docs.openshift.org/latest/minishift/getting-started/quickstart.html
 * https://github.com/minishift/minishift/issues/2121

## spinnaker
```
curl -L https://github.com/docker/machine/releases/download/v0.14.0/docker-machine-`uname -s`-`uname -m` > /tmp/docker-machine
sudo install /tmp/docker-machine /usr/local/bin/docker-machine

docker-machine ls
docker-machine create spinnaker

DOCKER_IP=`docker-machine ip spinnaker` docker-compose up -d
```
 * https://github.com/spinnaker/spinnaker/tree/master/experimental/docker-compose

## skaffold
```
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && chmod +x skaffold && sudo mv skaffold /usr/local/bin
```
 * https://github.com/GoogleCloudPlatform/skaffold

