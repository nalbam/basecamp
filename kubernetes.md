## kubectl
```
curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl

apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl

kubectl run sample-node --image=nalbam/sample-node:latest --port=8080
kubectl expose deployment sample-node --type=LoadBalancer
minikube service hello-node
```
 * https://kubernetes.io/docs/tasks/tools/install-kubectl/
 * https://kubernetes.io/docs/setup/independent/install-kubeadm/
 * https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/

## minikube
```
sudo curl -L minikube https://storage.googleapis.com/minikube/releases/v0.25.0/minikube-linux-amd64 -o /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube

minikube start --vm-driver kvm2

minikube docker-env

eval $(minikube docker-env)

docker ps
```
 * https://kubernetes.io/docs/tasks/tools/install-minikube/
