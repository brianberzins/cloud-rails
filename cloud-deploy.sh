#!/bin/bash
set -e +x

# write kube config file
mkdir ~/.kube
echo $KUBECONFIG_BASE64_CONTENTS | base64 --decode --ignore-garbage > ~/.kube/config
set -x

# override "latest" tag with a more specific one
sed -i "s~brianberzins/cloud-ruby:latest~${IMAGE_TAG}~" kubernetes/cloud-deployment.yml

# deploy the kubernetes manifest
kubectl apply --filename kubernetes/cloud-deployment.yml
# wait for the deployment to be available
kubectl wait --for=condition=available --timeout=180s deployment/cloud-ruby --namespace cloud-ruby
