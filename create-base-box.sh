#!/usr/bin/env bash

BOX_NAME=hx/k8-centos-v1

TEST_IF_BOX_EXISTS=$(vagrant box list | grep $BOX_NAME)
if [ "$1" -eq "-f" ]; then
    TEST_IF_BOX_EXISTS=""
    vagrant box remove $BOX_NAME
fi
if [ "$TEST_IF_BOX_EXISTS" = "" ]; then
    echo "$BOX_NAME does not exist, creating $BOX_NAME"
    mv Vagrantfile Vagrantfile.tmp
    cp Vagrantfile.BaseBox Vagrantfile
    vagrant up basebox
    vagrant halt basebox
    VBOX_INSTANCE=$(vboxmanage list vms | grep -oP "${PWD##*/}_basebox_[0-9_]*")
    vagrant package --base $VBOX_INSTANCE --output base.box
    BOX_FILE_PATH=$(echo "$PWD" | sed -E 's/\/cygdrive\/([a-z])(.*)/file:\/\/\/\1:\2\/base.box/')
    vagrant box add $BOX_NAME $BOX_FILE_PATH
    vagrant destroy -f
    rm -f base.box
    rm Vagrantfile
    mv Vagrantfile.tmp Vagrantfile
    echo "Done creating basebox..."
else
    echo "$BOX_NAME exists, moving on..."
fi
