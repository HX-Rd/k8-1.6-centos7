$vb_network = "local_k8s"
$master_memory = 1024
$worker_count = 3
$worker_memory = 1024

CLUSTER_CONFIG = File.expand_path("cluster-config.rb")
if File.exist?(CLUSTER_CONFIG)
  require CLUSTER_CONFIG
end

Vagrant.configure(2) do |config|
  config.vm.define "m1" do |m|
    m.vm.box = "geerlingguy/centos7"
    m.vm.hostname = "m1"
    m.vm.network "private_network", ip: "10.0.1.10", virtualbox__intnet: $vb_network
    m.vbguest.auto_update = false
  	m.vm.provider "virtualbox" do |vb|
      vb.memory = $master_memory
    end

    m.vm.provision "shell", path: "scripts/base/add-to-hosts.sh", args: ["m1", "10.0.1.10"]

    (1..$worker_count).each do |i|
      m.vm.provision "shell" do |s|
        s.path = "scripts/base/add-to-hosts.sh" 
        s.args = ["w#{i}", "10.0.1.#{50 + i}"]
      end
    end

    m.vm.provision "shell", path: "scripts/base/cert-imports.sh"
    m.vm.provision "shell", path: "scripts/base/add-package-repos.sh"
    m.vm.provision "shell", path: "scripts/base/install-support-packages.sh"
    m.vm.provision "shell", path: "scripts/base/user-pref.sh", privileged: false
    m.vm.provision "shell", path: "scripts/base/install-k8.sh"
    m.vm.provision "shell", path: "scripts/master/install-etcd.sh"
    m.vm.provision "shell", path: "scripts/master/start-services.sh"
  end

  (1..$worker_count).each do |i|
    config.vm.define "w#{i}" do |w|
      w.vm.box = "geerlingguy/centos7"
      w.vm.network "private_network", ip: "10.0.1.#{50 + i}", virtualbox__intnet: $vb_network
      w.vm.hostname = "w#{i}"
      w.vbguest.auto_update = false
      w.vm.provider "virtualbox" do |vb|
        vb.memory = $worker_memory
      end

      w.vm.provision "shell", path: "scripts/base/add-to-hosts.sh", args: ["m1", "10.0.1.10"]

      (1..$worker_count).each do |j|
        w.vm.provision "shell" do |s|
          s.path = "scripts/base/add-to-hosts.sh" 
          s.args = ["w#{i}", "10.0.1.#{50 + j}"]
        end
      end

      w.vm.provision "shell", path: "scripts/base/cert-imports.sh"
      w.vm.provision "shell", path: "scripts/base/add-package-repos.sh"
      w.vm.provision "shell", path: "scripts/base/install-support-packages.sh"
      w.vm.provision "shell", path: "scripts/base/user-pref.sh", privileged: false
      w.vm.provision "shell", path: "scripts/base/install-k8.sh"
    end
  end

end
