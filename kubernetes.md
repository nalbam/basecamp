## kubectl
```
export KUBE_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x kubectl && sudo mv kubectl /usr/local/bin/
```
 * https://kubernetes.io/docs/tasks/tools/install-kubectl/
 * https://kubernetes.io/docs/setup/independent/install-kubeadm/

## minikube
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
  chmod +x minikube && sudo mv minikube /usr/local/bin/

minikube start --vm-driver=kvm2  # ubuntu
minikube start --vm-driver=xhyve # mac

minikube dashboard

minikube docker-env

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

## skaffold
```
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
  chmod +x skaffold && sudo mv skaffold /usr/local/bin/
```
 * https://github.com/GoogleCloudPlatform/skaffold
