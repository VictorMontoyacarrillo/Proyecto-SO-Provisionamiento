Vagrant.configure("2") do |config|

  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/focal64"
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.56.10"
    web.vm.network "forwarded_port", guest: 80, host: 8081
  end

  config.vm.define "monitor" do |monitor|
    monitor.vm.box = "ubuntu/focal64"
    monitor.vm.hostname = "monitor"
    monitor.vm.network "private_network", ip: "192.168.56.11"
  end

end
