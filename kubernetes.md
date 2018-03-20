## kubectl
```
sudo curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl
```
 * https://kubernetes.io/docs/tasks/tools/install-kubectl/
 * https://kubernetes.io/docs/setup/independent/install-kubeadm/
 * https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/

## minikube
```
sudo curl -L minikube https://storage.googleapis.com/minikube/releases/v0.25.0/minikube-linux-amd64 -o /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube

minikube start --vm-driver kvm2

minikube dashboard

minikube docker-env

eval $(minikube docker-env)

docker ps
```
 * https://kubernetes.io/docs/tasks/tools/install-minikube/

## sample
```
kubectl run sample-node --image=nalbam/sample-node:latest --port=8080

kubectl expose deployment sample-node --type=LoadBalancer

kubectl get pods

kubectl describe pod sample-node

minikube service sample-node
```
