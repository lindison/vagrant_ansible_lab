#/bin/bash!

sudo su
set -e
set -x
systemctl stop NetworkManager
systemctl disable NetworkManager
systemctl enable network
yum install -y https://rdoproject.org/repos/rdo-release.rpm
yum install -y openstack-packstack
INTERNALIP=$(ifconfig | grep "inet" | grep "10.0.2" | awk '{ print $2 }')
EXTERNALIP=$(ifconfig | grep "inet" | grep "192.168" | awk '{ print $2 }')
/usr/bin/packstack --gen-answer-file=/tmp/answers
sed "s/$INTERNALIP/$EXTERNALIP/g" /tmp/answers > /tmp/answers-external
/usr/bin/packstack --answer-file=/tmp/answers-external
echo ""
echo "**** Logins ******"
echo ""
cat /root/keystonerc_admin
echo ""
cp /root/keystonerc_admin /home/vagrant
chown vagrant:vagrant /home/vagrant/keystonerc_admin
