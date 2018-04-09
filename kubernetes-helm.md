## helm
```
curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.8.2-linux-amd64.tar.gz

helm init

helm install --name ci stable/jenkins

helm list
helm history ci
helm upgrade ci stable/jenkins

helm delete --purge ci
```
* https://helm.sh/
* https://github.com/kubernetes/helm
* https://github.com/kubernetes/charts
* https://cloud.google.com/solutions/jenkins-on-kubernetes-engine
* https://cloud.google.com/solutions/continuous-delivery-spinnaker-kubernetes-engine
* https://thenewstack.io/build-extensible-ci-cd-pipelines-spinnaker-kubernetes/
