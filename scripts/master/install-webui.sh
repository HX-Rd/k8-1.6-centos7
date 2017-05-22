#!/usr/bin/env bash
echo "Installing webui"
kubectl create -f https://git.io/kube-dashboard --validate=false
echo "Done installing webui"
