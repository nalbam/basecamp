### install
```
sudo yum -u update
sudo yum install -y wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct

sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo
sudo yum install -y --enablerepo=epel ansible pyOpenSSL

git clone https://github.com/openshift/openshift-ansible

cd openshift-ansible
git checkout release-3.7

sudo ansible-playbook -i inventory/hosts.localhost playbooks/prerequisites.yml
sudo ansible-playbook -i inventory/hosts.localhost playbooks/deploy_cluster.yml
```
