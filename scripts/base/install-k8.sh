#!/usr/bin/env bash
echo "Install K8"
yum install -y docker kubelet kubeadm kubectl kubernetes-cni
echo "Done install K8"
