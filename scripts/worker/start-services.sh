#!/usr/bin/env bash
echo "Starting services for worker"
systemctl enable docker kubelet
systemctl start docker kubelet
echo "Done starting services for worker"
