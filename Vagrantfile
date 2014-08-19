# Basic Vagrant config to test client server architectures

# apart from the server node, create
# this many nodes in addition to the server
INSTANCES=1

# the nodes will be called server.example.net
# and node0.example.net, you can change this here
DOMAIN="example.net"

# the instances is a hostonly network, this will
# be the prefix to the subnet they use
SUBNET="192.168.2"

Vagrant.configure("2") do |config|
  config.vm.box = "centos-6.5"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/2236361/VMs/centos-6.5_x86_20140819.box"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "puppet/modules"
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  config.vm.define "server" do |vmconfig|
    vmconfig.vm.network "private_network", ip: "#{SUBNET}.10"
    vmconfig.vm.host_name = "server.#{DOMAIN}"
  end

  INSTANCES.times do |i|
    config.vm.define "node#{i}" do |vmconfig|
      vmconfig.vm.network "private_network", ip: "#{SUBNET}.%d" % (10 + i + 1)
      vmconfig.vm.host_name = "node%d.#{DOMAIN}" % i
    end
  end

end
