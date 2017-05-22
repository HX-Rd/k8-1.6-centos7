#!/usr/bin/env bash
echo "Adding package repose"
#cp /vagrant/files/virt7-docker-common-release.repo /etc/yum.repos.d/virt7-docker-common-release.repo
ARCH=x86_64
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-${ARCH}
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
   https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
setenforce 0
yum update
echo "Done adding package repos"
