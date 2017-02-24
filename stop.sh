#!/bin/bash

kubectl delete -f weave-kube/weave-kube.yaml
kubeadm reset

docker rm $(docker ps -q -a)

echo "\033[32mstop ok!\033[0m"
