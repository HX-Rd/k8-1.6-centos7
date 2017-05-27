#!/usr/bin/env bash
echo "Restarting network"
nmcli connection reload 
systemctl restart network.service
echo "Done restarting network"
