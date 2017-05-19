#!/usr/bin/env bash
echo "Adding package repose"
cp /vagrant/files/virt7-docker-common-release.repo /etc/yum.repos.d/virt7-docker-common-release.repo
yum update
echo "Done adding package repos"
