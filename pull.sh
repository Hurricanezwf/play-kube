#!bin/sh

docker pull registry.cn-hangzhou.aliyuncs.com/flowci/etcd-amd64:3.0.14-kubeadm
docker tag registry.cn-hangzhou.aliyuncs.com/flowci/etcd-amd64:3.0.14-kubeadm gcr.io/google_containers/etcd-amd64:3.0.14-kubeadm
docker rmi registry.cn-hangzhou.aliyuncs.com/flowci/etcd-amd64:3.0.14-kubeadm



docker pull registry.cn-hangzhou.aliyuncs.com/google-containers/exechealthz-amd64:1.1
docker tag registry.cn-hangzhou.aliyuncs.com/google-containers/exechealthz-amd64:1.1 gcr.io/google_containers/exechealthz-amd64:1.1
docker rmi registry.cn-hangzhou.aliyuncs.com/google-containers/exechealthz-amd64:1.1



docker pull registry.cn-hangzhou.aliyuncs.com/flowci/kube-apiserver-amd64:v1.5.1
docker tag registry.cn-hangzhou.aliyuncs.com/flowci/kube-apiserver-amd64:v1.5.1 gcr.io/google_containers/kube-apiserver-amd64:v1.5.1
docker rmi registry.cn-hangzhou.aliyuncs.com/flowci/kube-apiserver-amd64:v1.5.1



docker pull registry.cn-hangzhou.aliyuncs.com/flowci/kube-controller-manager-amd64:v1.5.1
docker tag registry.cn-hangzhou.aliyuncs.com/flowci/kube-controller-manager-amd64:v1.5.1 gcr.io/google_containers/kube-controller-manager-amd64:v1.5.1
docker rmi registry.cn-hangzhou.aliyuncs.com/flowci/kube-controller-manager-amd64:v1.5.1



docker pull registry.cn-hangzhou.aliyuncs.com/google-containers/kube-discovery-amd64:1.0
docker tag registry.cn-hangzhou.aliyuncs.com/google-containers/kube-discovery-amd64:1.0 gcr.io/google_containers/kube-discovery-amd64:1.0
docker rmi registry.cn-hangzhou.aliyuncs.com/google-containers/kube-discovery-amd64:1.0



docker pull registry.cn-hangzhou.aliyuncs.com/google-containers/kube-dnsmasq-amd64:1.3
docker tag registry.cn-hangzhou.aliyuncs.com/google-containers/kube-dnsmasq-amd64:1.3 registry.cn-hangzhou.aliyuncs.com/google-containers/kube-dnsmasq-amd64:1.3
docker rmi registry.cn-hangzhou.aliyuncs.com/google-containers/kube-dnsmasq-amd64:1.3



docker pull registry.cn-hangzhou.aliyuncs.com/flowci/kube-proxy-amd64:v1.5.1
docker tag registry.cn-hangzhou.aliyuncs.com/flowci/kube-proxy-amd64:v1.5.1 gcr.io/google_containers/kube-proxy-amd64:v1.5.1
docker rmi registry.cn-hangzhou.aliyuncs.com/flowci/kube-proxy-amd64:v1.5.1



docker pull registry.cn-hangzhou.aliyuncs.com/flowci/kube-scheduler-amd64:v1.5.1
docker tag registry.cn-hangzhou.aliyuncs.com/flowci/kube-scheduler-amd64:v1.5.1 gcr.io/google_containers/kube-scheduler-amd64:v1.5.1
docker rmi registry.cn-hangzhou.aliyuncs.com/flowci/kube-scheduler-amd64:v1.5.1



docker pull registry.cn-hangzhou.aliyuncs.com/google-containers/kubedns-amd64:1.7
docker tag registry.cn-hangzhou.aliyuncs.com/google-containers/kubedns-amd64:1.7 gcr.io/google_containers/kubedns-amd64:1.7
docker rmi registry.cn-hangzhou.aliyuncs.com/google-containers/kubedns-amd64:1.7



docker pull registry.cn-hangzhou.aliyuncs.com/google-containers/pause-amd64:3.0
docker tag registry.cn-hangzhou.aliyuncs.com/google-containers/pause-amd64:3.0 gcr.io/google_containers/pause-amd64:3.0
docker rmi registry.cn-hangzhou.aliyuncs.com/google-containers/pause-amd64:3.0



docker pull registry.cn-hangzhou.aliyuncs.com/weave/weave-kube:1.8.1
docker tag registry.cn-hangzhou.aliyuncs.com/weave/weave-kube:1.8.1 weaveworks/weave-kube:1.8.1
docker rmi registry.cn-hangzhou.aliyuncs.com/weave/weave-kube:1.8.1



docker pull registry.cn-hangzhou.aliyuncs.com/ts-kubernetes/weave-npc:1.8.1
docker tag registry.cn-hangzhou.aliyuncs.com/ts-kubernetes/weave-npc:1.8.1 weaveworks/weave-npc:1.8.1
docker rmi registry.cn-hangzhou.aliyuncs.com/ts-kubernetes/weave-npc:1.8.1

echo "\033[32m all done \033[0m"






