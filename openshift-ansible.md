## install with ansible
```
sudo yum update -y
sudo yum install -y git wget docker

sudo service docker start
sudo chkconfig docker on

sudo pip install -Iv ansible

git clone https://github.com/openshift/openshift-ansible.git

pushd openshift-ansible
git checkout release-3.7
popd

export IP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"

export DOMAIN=${DOMAIN:="${IP}.nip.io"}
export USERNAME=${USERNAME:="$(whoami)"}
export PASSWORD=${PASSWORD:=password}
export VERSION=${VERSION:="v3.7.2"}

ansible-playbook -i inventory.ini openshift-ansible/playbooks/byo/config.yml

htpasswd -b /etc/origin/master/htpasswd ${USERNAME} ${PASSWORD}
oc adm policy add-cluster-role-to-user cluster-admin ${USERNAME}
```
 * https://github.com/openshift/openshift-ansible
 * https://docs.openshift.org/latest/install_config/install/advanced_install.html
