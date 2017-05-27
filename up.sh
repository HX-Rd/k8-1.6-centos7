#!/usr/bin/env bash
vagrant up
vagrant ssh m1 -c "/vagrant/scripts/post/install-pod-network.sh"
vagrant ssh m1 -c "/vagrant/scripts/post/start-proxy.sh"
vagrant ssh m1 -c "/vagrant/scripts/post/install-webui.sh"
