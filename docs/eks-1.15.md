# eks-upgrade-1.15

* https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/update-cluster.html

## coredns

```
$ kubectl get configmap coredns -n kube-system -o yaml |grep upstream

          upstream
      {"apiVersion":"v1","data":{"Corefile":".:53 {\n    errors\n    health\n    kubernetes cluster.local in-addr.arpa ip6.arpa {\n      pods insecure\n      upstream\n      fallthrough in-addr.arpa ip6.arpa\n    }\n    prometheus :9153\n    forward . /etc/resolv.conf\n    cache 30\n    loop\n    reload\n    loadbalance\n}\n"},"kind":"ConfigMap","metadata":{"annotations":{},"labels":{"eks.amazonaws.com/component":"coredns","k8s-app":"kube-dns"},"name":"coredns","namespace":"kube-system"}}

$ kubectl edit configmap coredns -n kube-system -o yaml

# upstream 라인을 삭제

eks upgrade to 1.15
```

## 위 파일에서 버전을 1.15 로 변경

```
cluster_version = "1.15"

$ terraform apply
```

## kube-proxy

```
$ kubectl get daemonset kube-proxy --namespace kube-system -o=jsonpath='{$.spec.template.spec.containers[:1].image}'

602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/eks/kube-proxy:v1.14.6

$ kubectl set image daemonset.apps/kube-proxy \
    -n kube-system \
    kube-proxy=602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/eks/kube-proxy:v1.15.12-eksbuild.1
```

## CoreDNS

```
$ kubectl get pod -n kube-system -l k8s-app=kube-dns

NAME                      READY   STATUS    RESTARTS   AGE
coredns-dcc5cb8c4-2zqrq   1/1     Running   0          20h

$ kubectl describe deployment coredns --namespace kube-system | grep Image | cut -d "/" -f 3

coredns:v1.3.1

$ kubectl edit configmap coredns -n kube-system

proxy . /etc/resolv.conf

# proxy -> forward 로 변경

forward . /etc/resolv.conf

$ kubectl get deployment coredns --namespace kube-system -o=jsonpath='{$.spec.template.spec.containers[:1].image}'

602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/eks/coredns:v1.3.1

$ kubectl set image --namespace kube-system deployment.apps/coredns \
            coredns=602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/eks/coredns:v1.6.6-eksbuild.1
```

## Amazon VPC CNI

```
$ kubectl describe daemonset aws-node --namespace kube-system | grep Image | cut -d "/" -f 2

amazon-k8s-cni:v1.5.3

$ curl -o aws-k8s-cni.yaml https://raw.githubusercontent.com/aws/amazon-vpc-cni-k8s/v1.7.5/config/v1.7/aws-k8s-cni.yaml

$ sed -i -e 's/us-west-2/ap-northeast-2/' aws-k8s-cni.yaml

$ kubectl apply -f aws-k8s-cni.yaml
```

## eks worker node

* eks 버전이 1.15 로 올라가 있으므로, terraform apply 를 다시 한번 실행.

```
$ terraform apply

$ kubectl get no

NAME                                                STATUS   ROLES        AGE     VERSION
ip-10-128-204-194.ap-northeast-2.compute.internal   Ready    monitoring   81d     v1.14.9-eks-cc7316
ip-10-128-212-98.ap-northeast-2.compute.internal    Ready    <none>       6m48s   v1.15.12-eks-31566f
ip-10-128-215-129.ap-northeast-2.compute.internal   Ready    <none>       46d     v1.14.9-eks-cc7316
ip-10-128-215-203.ap-northeast-2.compute.internal   Ready    <none>       8d      v1.14.9-eks-cc7316
ip-10-128-216-111.ap-northeast-2.compute.internal   Ready    <none>       6m48s   v1.15.12-eks-31566f
ip-10-128-217-93.ap-northeast-2.compute.internal    Ready    <none>       93m     v1.14.9-eks-cc7316
ip-10-128-219-71.ap-northeast-2.compute.internal    Ready    <none>       8d      v1.14.9-eks-cc7316

$ k get no --show-labels | grep 'group=worker' | cut -d' ' -f1

$ kubectl cordon ip-10-128-212-194.ap-northeast-2.compute.internal

$ kubectl drain --delete-local-data --ignore-daemonsets ip-10-128-212-194.ap-northeast-2.compute.internal
```
