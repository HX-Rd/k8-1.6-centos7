#!/usr/bin/env bash
echo "Adding CA certs"
update-ca-trust force-enable
cp /vagrant/ca-certs/*.crt /etc/pki/ca-trust/source/anchors
cp /vagrant/ca-certs/*.cer /etc/pki/ca-trust/source/anchors
update-ca-trust extract
echo "Done adding CA certs"
