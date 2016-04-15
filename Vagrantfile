# Define the Vagrant environment for Ansible 101
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Create some load balancers
  (1..2).each do |i|
    config.vm.define "lb#{i}" do |lb|
        lb.vm.box="ubuntu/wily64"
        lb.vm.hostname = "web#{i}"
        lb.vm.network :private_network, ip: "192.168.33.2#{i}"
        lb.vm.network "forwarded_port", guest: 80, host: "622#{i}"
        lb.vm.provider "virtualbox" do |vb|
          vb.memory = "1024"
        end
    end
  end

  # Create some web servers
  (1..2).each do |i|
    config.vm.define "web#{i}" do |web|
        web.vm.box="ubuntu/wily64"
        web.vm.hostname = "web#{i}"
        web.vm.network :private_network, ip: "192.168.33.3#{i}"
        web.vm.network "forwarded_port", guest: 80, host: "633#{i}"
        web.vm.provider "virtualbox" do |vb|
          vb.memory = "1024"
        end
    end
  end

  # Create some Docker servers
  (1..2).each do |i|
    config.vm.define "docker#{i}" do |node|
        node.vm.box="ubuntu/wily64"
        node.vm.hostname = "docker#{i}"
        node.vm.network :private_network, ip: "192.168.33.4#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "644#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
        end
    end
  end

  # Create some dev servers
  (1..2).each do |i|
    config.vm.define "dev#{i}" do |dev|
        dev.vm.box="ubuntu/wily64"
        dev.vm.hostname = "dev#{i}"
        dev.vm.network :private_network, ip: "192.168.33.5#{i}"
        dev.vm.network "forwarded_port", guest: 80, host: "655#{i}"
        dev.vm.provider "virtualbox" do |vb|
          vb.memory = "1024"
        end
    end
  end

  # Create some app servers
  (1..2).each do |i|
    config.vm.define "app#{i}" do |app|
        app.vm.box="russmckendrick/centos7"
        app.vm.hostname = "app#{i}"
        app.vm.network :private_network, ip: "192.168.33.6#{i}"
        app.vm.network "forwarded_port", guest: 80, host: "666#{i}"
        app.vm.network "forwarded_port", guest: 8080, host: "667#{i}"
        app.vm.provider "virtualbox" do |vb|
          vb.memory = "1024"
        end
    end
  end

  # Create some db servers
  (1..2).each do |i|
    config.vm.define "db#{i}" do |db|
        db.vm.box="ubuntu/wily64"
        db.vm.hostname = "db#{i}"
        db.vm.network :private_network, ip: "192.168.33.7#{i}"
        db.vm.network "forwarded_port", guest: 80, host: "677#{i}"
        db.vm.provider "virtualbox" do |vb|
          vb.memory = "1024"
        end
    end

  # Create the Ansible Command Server
  config.vm.define :acs do |acs|
    acs.vm.box = "ubuntu/wily64"
    acs.vm.hostname = "acs"
    acs.vm.network "private_network", ip: "192.168.33.10"
    acs.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    acs.vm.provision :shell, path: "bootstrap-acs.sh"
  end

  end
end
