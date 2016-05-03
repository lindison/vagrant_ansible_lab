# Define the Vagrant environment for Ansible 101
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Create some load balancers
  (1..1).each do |i|
    config.vm.define "lb0#{i}" do |lb|
        lb.vm.box="ubuntu/trusty64"
        lb.vm.hostname = "lb0#{i}"
        lb.vm.network "public_network", bridge: "enp6s0", ip: "192.168.1.13#{i}"
        lb.vm.provision "shell",
          run: "always",
          inline: "route add default gw 192.168.1.1"
        lb.vm.provider "virtualbox" do |vb|
          vb.memory = "512"
        end
    end
  end


  # Create some web servers
  (1..3).each do |i|
    config.vm.define "web0#{i}" do |web|
        web.vm.box="ubuntu/trusty64"
        web.vm.hostname = "web0#{i}"
#        web.vm.network :private_network, ip: "192.168.33.3#{i}"
#        web.vm.network "forwarded_port", guest: 80, host: "632#{i}"
        web.vm.network "public_network", bridge: "enp6s0", ip: "192.168.1.14#{i}"
        web.vm.provision "shell",
          run: "always",
          inline: "route add default gw 192.168.1.1"
        web.vm.provider "virtualbox" do |vb|
          vb.memory = "512"
        end
    end
  end

  # Create some Docker servers
  (1..1).each do |i|
    config.vm.define "docker0#{i}" do |node|
        node.vm.box="ubuntu/wily64"
        node.vm.hostname = "docker0#{i}"
        node.vm.network "public_network", bridge: "enp6s0", ip: "192.168.1.15#{i}"
        node.vm.provision "shell",
          run: "always",
          inline: "route add default gw 192.168.1.1"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
        end
    end
  end

  # Create some dev servers
  (1..1).each do |i|
    config.vm.define "dev0#{i}" do |dev|
        dev.vm.box="ubuntu/wily64"
        dev.vm.hostname = "dev0#{i}"
#        dev.vm.network :private_network, ip: "192.168.33.5#{i}"
        dev.vm.network "public_network", bridge: "enp6s0", ip: "192.168.1.16#{i}"
        dev.vm.provision "shell",
          run: "always",
          inline: "route add default gw 192.168.1.1"
#        dev.vm.network "forwarded_port", guest: 80, host: "655#{i}"
        dev.vm.provider "virtualbox" do |vb|
          vb.memory = "1024"
        end
    end
  end

  # Create some app servers
  (1..1).each do |i|
    config.vm.define "app0#{i}" do |app|
        app.vm.box="russmckendrick/centos7"
        app.vm.hostname = "app0#{i}"
 #       app.vm.network :private_network, ip: "192.168.33.6#{i}"
 #       app.vm.network "forwarded_port", guest: 80, host: "666#{i}"
 #       app.vm.network "forwarded_port", guest: 8080, host: "667#{i}"
       app.vm.network "public_network", bridge: "enp6s0", ip: "192.168.1.17#{i}"
       app.vm.provision "shell",
          run: "always",
          inline: "route add default gw 192.168.1.1"
       app.vm.provider "virtualbox" do |vb|
          vb.memory = "512"
        end
    end
  end

  # Create some db servers
  (1..2).each do |i|
    config.vm.define "db0#{i}" do |db|
        db.vm.box="ubuntu/trusty64"
        db.vm.hostname = "db0#{i}"
#        db.vm.network :private_network, ip: "192.168.33.7#{i}"
#        db.vm.network "forwarded_port", guest: 80, host: "677#{i}"
        db.vm.network "public_network", bridge: "enp6s0", ip: "192.168.1.18#{i}"
        db.vm.provision "shell",
          run: "always",
          inline: "route add default gw 192.168.1.1"
        db.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
        end
    end

  # Create the Ansible Command Server
  config.vm.define :acs do |acs|
    acs.vm.box = "ubuntu/wily64"
    acs.vm.hostname = "acs"
#    acs.vm.network "private_network", ip: "192.168.33.10"
    acs.vm.network "public_network", bridge: "enp6s0"
    acs.vm.provision "shell",
      run: "always",
      inline: "route add default gw 192.168.1.1"
    acs.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
    acs.vm.provision :shell, path: "bootstrap-acs.sh"
  end

  end
end
