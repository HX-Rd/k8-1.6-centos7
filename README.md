# k8-1.6-centos7

## Description
Install kubernetes 1.6 on centos 7. Using weave-kube

## Usage
Add a cluster-config.rb and specify the cluster you want to setup. See cluster-config-sample.rb for an example.
Supported variables are  
  
$vb_network             => The local private vagrant network name, defaults to local_k8s  
$master_ip              => The ip on the local private vagrant network  
$master_memory          => The master node memory in mb  
$worker_count           => The number of workers to create  
$worker_memory          => The worker node memory in mb  

### Creating the cluster
To create the base image used both for the master and the worker nodes run
``` bash
./create-base-box.sh
```
Then to spin up the cluster
``` bash
./up.sh
```
you can now access the kuberneties ui from you local machine
http://localhost:8001/ui

### Few notes
After you spin up the cluster, it can take a few seconds for the UI to repond to requests.  
  
if you have already created the base box, you can force the recreation of it with the flag -f
``` bash
./create-base-box.sh -f
```

To shut down the cluster you can use default vagrant commands
``` bash
vagrant halt
```

To start a shut down cluster, run the vagrant up command
``` bash
vagrant up
```

To destroy the cluster, use the vagrant command destroy
``` bash
vagrant destroy -f
```

### Adding custom scripts
If you want to install additional software or configure some thing else, you can place the scripts under  
  
scripts/base-extra/           => Will run on the base image  
scripts/master-extra/         => Will run when the master is created  
scripts/worker-extra/         => Will run when the worker is created  
  
The scripts in these folders will run in alphabetical order, so if the order matters, consider nameing the scripts something like  
001-somename.sh  
002-othername.sh  
...  

### Adding ca certs
You can add extra ca certs in the ca-certs folder and these will be baked into the base box
