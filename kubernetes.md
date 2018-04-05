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
```
# To start using your cluster, you need to run the following as a regular user:

mkdir -p $HOME/.kube
sudo cp -rf /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo systemctl status kubelet -l

watch kubectl get node,pod,svc,ing --all-namespaces

TUNL_IP=$(ifconfig tunl0 | grep inet | awk -F' ' '{print $2}')
IP_LIST=$(kubectl get svc --all-namespaces | grep LoadBalancer | awk -F' ' '{print $6}')

```
 * https://kubernetes.io/docs/tasks/tools/install-kubectl/
 * https://kubernetes.io/docs/setup/independent/install-kubeadm/
 * https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
 * https://www.linuxtechi.com/install-kubernetes-1-7-centos7-rhel7/
 * https://amasucci.com/post/2017/10/22/how-to-install-kubernetes-1.8.1-on-centos-7.3/

## minikube
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
  chmod +x minikube && sudo mv minikube /usr/local/bin/

minikube config set cpus 2
minikube config set memory 8GB
minikube config set vm-driver kvm2

minikube start --vm-driver=kvm2  # ubuntu
minikube start --vm-driver=xhyve # mac

minikube dashboard

eval $(minikube docker-env)

docker ps
```
 * https://kubernetes.io/docs/tasks/tools/install-minikube/
 * https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/

## sample
```
kubectl run sample-node --image=nalbam/sample-node:latest --port=3000
kubectl expose deployment sample-node --type=LoadBalancer

kubectl set image deployment/sample-node sample-node=nalbam/sample-node:latest

kubectl get pods
kubectl describe pod sample-node

minikube service sample-node

kubectl delete deployment sample-node
kubectl delete service sample-node
```

## helm
```
curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.8.2-linux-amd64.tar.gz

helm init
helm install --name nalbam stable/jenkins
```
 * https://helm.sh/
 * https://github.com/kubernetes/helm

## kops
```
export KOPS_VERSION=$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64 && \
  chmod +x kops-linux-amd64 && sudo mv kops-linux-amd64 /usr/local/bin/kops
```
 * https://github.com/kubernetes/kops
 * https://kubernetes.io/docs/getting-started-guides/kops/

## coreos tectonic
 * https://coreos.com/tectonic/docs/latest/install/aws/index.html
 * https://coreos.com/tectonic/docs/latest/install/aws/uninstall.html
