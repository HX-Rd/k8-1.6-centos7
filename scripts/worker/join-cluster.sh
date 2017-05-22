#!/usr/bin/env bash
sysctl net.bridge.bridge-nf-call-iptables=1
sysctl net.bridge.bridge-nf-call-ip6tables=1
kubeadm join --token $(cat /vagrant/join-token) $1:6443
