#!/usr/bin/env bash
sysctl net.bridge.bridge-nf-call-iptables=1
sysctl net.bridge.bridge-nf-call-ip6tables=1
sed -i 's#Environment="KUBELET_KUBECONFIG_ARGS=-.*#Environment="KUBELET_KUBECONFIG_ARGS=--kubeconfig=/etc/kubernetes/kubelet.conf --require-kubeconfig=true --cgroup-driver=systemd"#g' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
kubeadm init --apiserver-advertise-address=$1 --pod-network-cidr 10.244.0.0/16
sudo tee /etc/modules-load.d/overlay.conf <<-'EOF' 
overlay
EOF
rm -f /vagrant/join-token
echo "STORAGE_DRIVER=\"overlay\"" >> /etc/sysconfig/docker-storage-setup
kubeadm token list | tail -n 1 | awk '{print $1}' > /vagrant/join-token
mkdir -p /root/.kube
cp /etc/kubernetes/admin.conf /root/.kube/config
#kubectl create -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel-rbac.yml
#kubectl create -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply --filename https://git.io/weave-kube-1.6
