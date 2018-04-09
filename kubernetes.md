## install with kubeadm
* https://github.com/nalbam/basecamp/blob/master/kubernetes-kubeadm.md

## install with minikube
* https://github.com/nalbam/basecamp/blob/master/kubernetes-minikube.md

## install with kops
* https://github.com/nalbam/basecamp/blob/master/kubernetes-kops.md

## addons
* https://github.com/nalbam/basecamp/blob/master/kubernetes-addons.md

## helm
* https://github.com/nalbam/basecamp/blob/master/kubernetes-helm.md

## sample
```
git clone https://github.com/nalbam/kubernetes.git
cd kubernetes

kubectl apply -f sample/sample-node.yml
kubectl apply -f sample/sample-spring.yml
kubectl apply -f sample/sample-web.yml

watch kubectl get node,pod,svc,ing -n default

kubectl describe pod sample-web
```
