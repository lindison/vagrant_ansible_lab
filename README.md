# Ansible Learning environment

Ensure you have enough memory to run this vagrant up. 

Simple, run: vagrant up

This will build you:

8 x Ubuntu servers
web01 / web02
dev01 / dev02
lb01
docker01
db01
acs

2 x CentOS servers
app01
app02

This will install Ansible
Populate the Ansible host file
This will also populate the /etc/hosts file with IPs (192.168.33.x network). 

As for the names file. Currently, names is used 

`ssh-keyscan $(cat names) > .ssh/known_hosts`

After which, run:

`ssh-keygen`

Accept defaults; afterwhich, run:

`ansible-playbook ./Playbooks/ssh-addkey.yml -k`

This will prompt for the vagrant password "vagrant" and will install the ssh keys with the nodes in the hosts file. 

This should set up a basic starting point in doing some ansible learning. Run the command:

`ansible all --list-hosts`

and:

`ansible all -m ping`

