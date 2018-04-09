## install
```
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

setenforce 0
yum install -y kubelet kubeadm kubectl
systemctl enable kubelet && systemctl start kubelet

cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

docker info | grep -i cgroup

vi /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
Environment="KUBELET_CGROUP_ARGS=--cgroup-driver=systemd --runtime-cgroups=/systemd/system.slice --kubelet-cgroups=/systemd/system.slice"

kubeadm init

kubeadm reset

systemctl status kubelet

# Installing a pod network
kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/kubeadm/1.7/calico.yaml

# Master Isolation
kubectl taint nodes --all node-role.kubernetes.io/master-
```
* To start using your cluster, you need to run the following as a regular user:
```
mkdir -p $HOME/.kube
sudo cp -rf /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo systemctl status kubelet -l

watch kubectl get node,pod,svc,ing --all-namespaces

ifconfig tunl0 | grep inet | awk -F' ' '{print $2}'
```
 * https://kubernetes.io/docs/tasks/tools/install-kubectl/
 * https://kubernetes.io/docs/setup/independent/install-kubeadm/
 * https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
 * https://www.linuxtechi.com/install-kubernetes-1-7-centos7-rhel7/
 * https://amasucci.com/post/2017/10/22/how-to-install-kubernetes-1.8.1-on-centos-7.3/
