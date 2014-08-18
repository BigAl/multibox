# Basic Vagrant config to test client server architectures

# apart from the server node, create
# this many nodes in addition to the server
INSTANCES=1

# the nodes will be called server.example.net
# and node0.example.net, you can change this here
DOMAIN="example.net"

# these nodes do not need a lot of RAM, 384 is
# is enough but you can tweak that here

# the instances is a hostonly network, this will
# be the prefix to the subnet they use
SUBNET="192.168.2"

Vagrant::Config.run do |config|
  config.vm.define :server do |vmconfig|
    vmconfig.vm.box = "centos-6.5"
    vmconfig.vm.network :hostonly, "#{SUBNET}.10"
    vmconfig.vm.host_name = "server.#{DOMAIN}"
    vmconfig.vm.provision :shell, :path => "bootstrap.sh"

  end

  INSTANCES.times do |i|
    config.vm.define "node#{i}".to_sym do |vmconfig|
      vmconfig.vm.box = "centos-6.5"
      vmconfig.vm.network :hostonly, "#{SUBNET}.%d" % (10 + i + 1)
      vmconfig.vm.host_name = "node%d.#{DOMAIN}" % i
      vmconfig.vm.provision :shell, :path => "bootstrap.sh"

    end
  end
end
