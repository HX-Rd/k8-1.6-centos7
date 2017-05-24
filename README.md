# k8s-practise

## Description
This project sets up kubernetes 1.6 cluster on centos 7 machines.

##Assumptions about your environment
This setup assumes that you are running on windows with cygwin installed. If this is not the case you will have to modify the BOX_FILE_PATH  in create-base-box.sh
You will also have to have vagrant installed.

Although not used, you will have to have vagrant-vbguest plugin installed or vagrant up will fail, you can install the plugin like so
```bash
vagrant install plugin vagrant-vbguest
```
or you can simply remove the vbguest.auto_update = false from the Vagrantfile

## Usage

run
```bash
./create-base-box.sh
```
This create the basebox
Setup how big of a cluster you want in cluster-config.rb
Then run ```
vagrant up
```
