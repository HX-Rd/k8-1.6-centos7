#!/usr/bin/env bash
echo "Installing support packages"
yum install unzip -y > /dev/null
yum install vim -y > /dev/null
yum install git -y > /dev/null
yum install ntp -y > /dev/null
echo "Done support packages"
