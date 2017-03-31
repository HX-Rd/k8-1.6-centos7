$common_init = <<COMMON_INIT
#sudo update-ca-trust force-enable
#sudo cp /vagrant/certs/newcert.cer /etc/pki/ca-trust/source/anchors
#sudo update-ca-trust extract
sudo yum install ntp -y > /dev/null
sudo systemctl enable ntpd
sudo systemctl start ntpd
sudo yum install vim -y > /dev/null
sudo yum install unzip -y > /dev/null
sudo \\cp -rf /vagrant/files/hosts /etc/hosts
sudo cp /vagrant/files/virt7-docker-common-release.repo /etc/yum.repos.d/virt7-docker-common-release.repo
sudo yum update
sudo yum install -y --enablerepo=virt7-docker-common-release kubernetes docker
COMMON_INIT

$master_init = <<MASTER_INIT
MASTER_INIT

Vagrant.configure(2) do |config|
  config.vm.define "master" do |master|
    master.vm.box = "geerlingguy/centos7"
    master.vm.network "private_network", ip: "10.0.1.10", virtualbox__intnet: "local_k8s"
    #master.vm.network "forwarded_port", guest: 80, host: 8099, guest_ip: "10.0.1.2"
  	master.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end

    master.vm.provision "shell", inline: $common_init
  end

  config.vm.define "mone" do |mone|
    mone.vm.box = "geerlingguy/centos7"
    mone.vm.network "private_network", ip: "10.0.1.11", virtualbox__intnet: "local_k8s"
    mone.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end

    mone.vm.provision "shell", inline: $common_init
  end

  config.vm.define "mtwo" do |mtwo|
    mtwo.vm.box = "geerlingguy/centos7"
    mtwo.vm.network "private_network", ip: "10.0.1.12", virtualbox__intnet: "local_k8s"
    mtwo.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end

    mtwo.vm.provision "shell", inline: $common_init
  end

  config.vm.define "mthree" do |mthree|
    mthree.vm.box = "geerlingguy/centos7"
    mthree.vm.network "private_network", ip: "10.0.1.13", virtualbox__intnet: "local_k8s"
    mthree.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end

    mthree.vm.provision "shell", inline: $common_init
  end
end