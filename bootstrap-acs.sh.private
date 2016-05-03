#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible
apt-get -y install tree
apt-get -y install python-passlib

# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant
mv /etc/ansible/hosts /etc/ansible/hosts.orig
cp /vagrant/hosts /etc/ansible/hosts

# setup /etc/ansible/ansible.cfg

cat > /etc/ansible/ansible.cfg <<EOL

[defaults]

forks          = 10
remote_port    = 22

EOL


# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes

192.168.33.10 acs
192.168.33.21 lb01
# 192.168.33.22 lb02
192.168.33.31 web01
192.168.33.32 web02
192.168.33.33 web03
192.168.33.41 docker01
# 192.168.33.42 docker02
192.168.33.51 dev01
# 192.168.33.52 dev02
192.168.33.61 app01
# 192.168.33.62 app02
192.168.33.71 db01
192.168.33.72 db02

EOL

ssh-keyscan $(cat names) > /home/vagrant/.ssh/known_hosts
chown vagrant:vagrant /home/vagrant/.ssh/known_hosts
