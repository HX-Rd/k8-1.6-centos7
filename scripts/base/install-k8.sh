#!/usr/bin/env bash
echo "Install K8"
yum install -y --enablerepo=virt7-docker-common-release kubernetes docker > /dev/null
echo "Done install K8"
