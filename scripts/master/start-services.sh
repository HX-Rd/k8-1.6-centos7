#!/usr/bin/env bash
echo "Starting master services"
systemctl enable etcd kube-apiserver kube-controller-manager kube-scheduler
systemctl start etcd kube-apiserver kube-controller-manager kube-scheduler
echo "Done starting master services"
