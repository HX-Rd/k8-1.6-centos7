#!/usr/bin/env bash
cd /home/vagrant
wget https://github.com/HX-Rd/lx-pref/archive/master.zip -O lx-pref-master.zip -o /dev/null
unzip /home/vagrant/lx-pref-master.zip
cp -r /home/vagrant/lx-pref-master/\.* .
sudo mv /home/vagrant/lx-pref-master/\.* /root/
rm -rf /home/vagrant/lx-pref-master
rm -f /home/vagrant/lx-pref-master.zip
sudo ssh-keyscan gitlab.com >> /home/vagrant/.ssh/known_hosts
sudo ssh-keyscan github.com >> /home/vagrant/.ssh/known_hosts
git config --global core.editor vim
cp /vagrant/.ssh/* /home/vagrant/.ssh/
sudo mkdir -p /root/.ssh
sudo cp /home/vagrant/.ssh/* /root/.ssh/
sudo chmod 700 /home/vagrant/.ssh
sudo chmod 600 /home/vagrant/.ssh/*
sudo sh -c "chmod 700 /root/.ssh"
sudo sh -c "chmod 600 /root/.ssh/*"
