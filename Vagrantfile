Vagrant.configure("2") do |config|

  # ---------------------------
  # MAQUINA WEB
  # ---------------------------
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/focal64"
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.56.10"
    web.vm.network "forwarded_port", guest: 80, host: 8081
    
    web.vm.provision "shell", path: "playbook_web.sh"
  end

  # ---------------------------
  # MAQUINA MONITOR
  # ---------------------------
  config.vm.define "monitor" do |monitor|
    monitor.vm.box = "ubuntu/focal64"
    monitor.vm.hostname = "monitor"
    monitor.vm.network "private_network", ip: "192.168.56.11"

    monitor.vm.provision "shell", path: "playbook_monitor.sh"
  end

end
