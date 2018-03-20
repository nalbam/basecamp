## KVM
```
egrep -c '(vmx|svm)' /proc/cpuinfo
egrep -c ' lm ' /proc/cpuinfo
kvm-ok
uname -m

sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

sudo adduser `id -un` kvm
sudo adduser `id -un` libvirtd

virsh list --all

sudo ls -la /var/run/libvirt/libvirt-sock

ls -l /dev/kvm

sudo apt-get install virt-manager
```
 * https://help.ubuntu.com/community/KVM/Installation

## minishift
```
sudo curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.7.0/docker-machine-driver-kvm -o /usr/local/bin/docker-machine-driver-kvm
sudo chmod +x /usr/local/bin/docker-machine-driver-kvm

minishift config set skip-check-kvm-driver true

minishift start
```
 * https://docs.openshift.org/latest/minishift/getting-started/quickstart.html
 * https://github.com/minishift/minishift/issues/2121
