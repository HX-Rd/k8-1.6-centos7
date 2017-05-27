#!/usr/bin/env bash
echo "Installing webui"
sudo kubectl create -f https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml
echo "Done installing webui"
