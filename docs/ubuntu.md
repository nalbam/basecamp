# ubuntu

## prepare

```bash
curl -sL toaster.run/install | bash
```

## sudo

```bash
sudo visudo
```

## Hangul

* <http://hochulshin.com/ubuntu-1604-hangul/>

## backgroubd

```bash
sudo apt install -y wallch
```

## KVM

```bash
uname -m
egrep -c '(vmx|svm)' /proc/cpuinfo
egrep -c ' lm ' /proc/cpuinfo
kvm-ok

sudo apt install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

sudo adduser `id -un` libvirtd
sudo adduser `id -un` kvm

sudo usermod -a -G libvirtd $(whoami)
newgrp libvirtd

virsh list --all

sudo ls -la /var/run/libvirt/libvirt-sock

ls -l /dev/kvm

sudo apt install virt-manager

export VERSION=$(curl -s https://api.github.com/repos/dhiltgen/docker-machine-kvm/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://github.com/dhiltgen/docker-machine-kvm/releases/download/${VERSION}/docker-machine-driver-kvm && \
  chmod +x docker-machine-driver-kvm && sudo mv docker-machine-driver-kvm /usr/local/bin/

curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 && \
  chmod +x docker-machine-driver-kvm2 && sudo mv docker-machine-driver-kvm2 /usr/local/bin/
```

* <https://help.ubuntu.com/community/KVM/Installation>
* <https://github.com/kubernetes/minikube/blob/master/docs/drivers.md>

## docker-machine

```bash
export VERSION=$(curl -s https://api.github.com/repos/docker/machine/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -L https://github.com/docker/machine/releases/download/${VERSION}/docker-machine-`uname -s`-`uname -m` > /tmp/docker-machine
sudo install /tmp/docker-machine /usr/local/bin/docker-machine

docker-machine ls
```

## spinnaker

```bash
DOCKER_IP=`docker-machine ip spinnaker` docker-compose up -d
```

* <https://github.com/spinnaker/spinnaker/tree/master/experimental/docker-compose>

## nvidia

```bash
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-390
```

## reset

```bash
sudo service lightdm stop
rm -rf ~/.config/dconf/user
sudo service lightdm start
```

## remove oracle java

```bash
sudo dpkg --list | grep -i jdk

sudo apt -y purge oracle-java8-installer
sudo apt -y autoremove

sudo dpkg --list | grep -i jdk
```
