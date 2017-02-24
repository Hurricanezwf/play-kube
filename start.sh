#!/bin/bash

kubeadm init --use-kubernetes-version v1.5.1

kubectl create -f weave-kube/weave-kube.yaml

echo "\033[32m start ok!\033[0m"
