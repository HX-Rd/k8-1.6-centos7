#!/usr/bin/env bash
echo "Starting services for worker"
systemctl enable docker
systemctl start docker
systemctl enable kubelet
systemctl start kubelet
echo "Done starting services for worker"
