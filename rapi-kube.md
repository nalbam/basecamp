# rapi-kube

```bash
curl -sSL get.docker.com | sh
sudo usermod pi -aG docker
```

```bash
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
```

```bash
sudo vi /boot/cmdline.txt
```

```text
cgroup_enable=cpuset cgroup_enable=memory
```

```bash
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -q
sudo apt-get install -qy kubeadm
```

```bash
sudo kubeadm init --apiserver-advertise-address=192.168.170.2
```

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
