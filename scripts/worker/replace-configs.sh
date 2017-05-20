#!/usr/bin/env bash
echo "Replaceing configs"

\cp -f /vagrant/files/k8/config /etc/kubernetes/config
\cp -f /vagrant/files/k8/kubelet /etc/kubernetes/kubelet
sed -i s/KUBELET_HOSTNAME/KUBELET_HOSTNAME=\"--hostname-override=$1\"/g /etc/kubernetes/kubelet

chmod 644 /etc/kubernetes/config
chmod 644 /etc/kubernetes/kubelet

echo "Done replaceing configs"
