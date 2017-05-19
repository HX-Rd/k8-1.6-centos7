#!/usr/bin/env bash
echo "Adding to hosts file $1 -> $2"
echo "$2    $1" >> /etc/hosts
echo "Done adding row to host file"
