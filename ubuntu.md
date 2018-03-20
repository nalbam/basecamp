## KVM
```
egrep -c '(vmx|svm)' /proc/cpuinfo
egrep -c ' lm ' /proc/cpuinfo
kvm-ok
uname -m

sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

```
 * https://help.ubuntu.com/community/KVM/Installation
 * http://naturax.tistory.com/15
