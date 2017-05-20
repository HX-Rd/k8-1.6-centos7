#!/usr/bin/env bash
echo "Replaceing configs"

\cp -f /vagrant/files/etcd/etcd.conf /etc/etcd/etcd.conf
\cp -f /vagrant/files/k8/config /etc/kubernetes/config
\cp -f /vagrant/files/k8/apiserver /etc/kubernetes/apiserver

chmod 644 /etc/etcd/etcd.conf
chmod 644 /etc/kubernetes/config
chmod 644 /etc/kubernetes/apiserver

echo "Done replaceing configs"
