#!/bin/bash
set -ex

kind --version
docker --version
kubectl --version
#
## delete any previous kind cluster
#kind delete cluster || true
## create a local kind cluster
#kind create cluster --config kubernetes/kind-config.yml
#
## build the docker image
#docker build --tag cloud-ruby:local .
## load the docker image locally into kind
#kind load docker-image cloud-ruby:local
#
## run our our local deployment (including namespace, deployment, service)
#kubectl apply --filename kubernetes/local-deployment.yml
#
## trying to troubleshoot on the CI system
#kubectl logs --selector  k8s-app=kube-proxy --namespace kube-system
#kubectl describe pods --selector  k8s-app=kube-proxy --namespace kube-system
#
## wait for our application to be ready
#kubectl wait --namespace cloud-ruby --for=condition=ready pod --selector=app=cloud-ruby --timeout=30s
#
## test that we can get to the application
#curl --include --silent http://localhost:30123/hello-world | grep "200 OK"