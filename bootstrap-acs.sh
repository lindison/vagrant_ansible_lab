#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible
apt-get install tree


# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant
ssh-keyscan $(cat names) > .ssh/known_hosts
cat >> /home/vagrant/hosts <<EOL

[all:vars]
ansible_connection: ssh
ansible_ssh_user: vagrant
ansible_ssh_pass: vagrant

EOL


# setup /etc/ansible/ansible.cfg

cat > /etc/ansible/ansible.cfg <<EOL

[defaults]

inventory      = /home/vagrant/hosts
forks          = 10
remote_port    = 22

EOL


# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes

192.168.33.10 acs
192.168.33.21 lb1
192.168.33.22 lb2
192.168.33.31 web1
192.168.33.32 web2
192.168.33.41 docker1
192.168.33.42 docker2
192.168.33.51 dev1
192.168.33.52 dev2
192.168.33.61 app1
192.168.33.62 app2
192.168.33.71 db1
192.168.33.72 db2

EOL


