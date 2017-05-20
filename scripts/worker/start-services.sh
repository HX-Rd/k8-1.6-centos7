#!/usr/bin/env bash
echo "Starting services for worker"
systemctl enable kube-proxy kubelet docker
systemctl start kube-proxy kubelet docker
echo "Done starting services for worker"
