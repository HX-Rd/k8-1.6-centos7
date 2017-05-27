$box_name = "hx/k8-centos-v1"

$vb_network = "local_k8s"

$master_ip = "10.0.0.10"

$master_memory = 1024
$worker_count = 3
$worker_memory = 1024

CLUSTER_CONFIG = File.expand_path("cluster-config.rb")
if File.exist?(CLUSTER_CONFIG)
  require CLUSTER_CONFIG
end

Vagrant.configure(2) do |config|
  config.vm.define "m1" do |m|
    m.vm.box = $box_name
    m.vm.hostname = "m1"
    m.vm.network "forwarded_port", guest: 8001, host: 8001
    m.vm.network "private_network", ip: $master_ip , virtualbox__intnet: $vb_network
    m.vbguest.auto_update = false
  	m.vm.provider "virtualbox" do |vb|
      vb.memory = $master_memory
    end

    m.vm.provision "shell", path: "scripts/common/restart-network.sh", run: "always"

    (1..$worker_count).each do |i|
      m.vm.provision "shell" do |s|
        s.path = "scripts/common/add-to-hosts.sh" 
        s.args = ["w#{i}", "10.0.0.#{50 + i}"]
      end
    end

    m.vm.provision "shell", path: "scripts/common/start-services.sh"
    m.vm.provision "shell", path: "scripts/master/init-master.sh", args: $master_ip

    scripts = Dir.entries('scripts/master-extra').sort
    scripts.each do |script|
      next if script == '.' or script == '..' or script == '.placeholder'
      m.vm.provision "shell", path: "scripts/master-extra/#{script}", privileged: false
    end
  end

  (1..$worker_count).each do |i|
    config.vm.define "w#{i}" do |w|
      w.vm.box = $box_name
      w.vm.network "private_network", ip: "10.0.0.#{50 + i}", virtualbox__intnet: $vb_network
      w.vm.hostname = "w#{i}"
      w.vbguest.auto_update = false
      w.vm.provider "virtualbox" do |vb|
        vb.memory = $worker_memory
      end

      w.vm.provision "shell", path: "scripts/common/add-to-hosts.sh", args: ["m1", $master_ip ]
      w.vm.provision "shell", path: "scripts/common/restart-network.sh", run: "always"

      (1..$worker_count).each do |j|
        if i != j
          w.vm.provision "shell" do |s|
            s.path = "scripts/common/add-to-hosts.sh" 
            s.args = ["w#{i}", "10.0.0.#{50 + j}"]
          end
        end
      end

      w.vm.provision "shell", path: "scripts/common/start-services.sh"
      w.vm.provision "shell", path: "scripts/worker/join-cluster.sh", args: $master_ip
      scripts = Dir.entries('scripts/worker-extra').sort
      scripts.each do |script|
        next if script == '.' or script == '..' or script == '.placeholder'
        m.vm.provision "shell", path: "scripts/worker-extra/#{script}", privileged: false
      end

    end
  end

end
