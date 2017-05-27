#!/usr/bin/env bash
echo "Starting proxy"
sudo nohup kubectl proxy --address='0.0.0.0' --port=8001 --accept-hosts='^*$' > /dev/null 2>&1 &
sleep 4
echo "Proxy started"
