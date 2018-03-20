### install
```
sudo yum update -y
sudo yum install -y docker

sudo service docker start
sudo chkconfig docker on

wget https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-server-v3.7.1-ab0f056-linux-64bit.tar.gz
tar -xvzf openshift-origin-server-v3.7.1-ab0f056-linux-64bit.tar.gz
sudo cp openshift-origin-server-v3.7.1-ab0f056-linux-64bit/oc /usr/local/bin/

sudo vi /etc/sysconfig/docker
OPTIONS="--default-ulimit nofile=1024:4096 --insecure-registry 172.30.0.0/16"

sudo service docker restart

sudo mount --make-shared /
sudo sed -i.bak -e \
 's:^\(\ \+\)"$unshare" -m -- nohup:\1"$unshare" -m --propagation shared -- nohup:' \
 /etc/init.d/docker

sudo /usr/local/bin/oc cluster up --routing-suffix=13.124.112.3.nip.io --public-hostname=13.124.112.3.nip.io

sudo /usr/local/bin/oc cluster down
```

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

export DOMAIN=${DOMAIN:="$(curl ipinfo.io/ip).nip.io"}
export USERNAME=${USERNAME:="$(whoami)"}
export PASSWORD=${PASSWORD:=password}
export VERSION=${VERSION:="v3.7.1"}

export IP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"

ansible-playbook -i inventory.ini openshift-ansible/playbooks/byo/config.yml

htpasswd -b /etc/origin/master/htpasswd $USERNAME $PASSWORD
oc adm policy add-cluster-role-to-user cluster-admin $USERNAME

```

## minishift
```
wget https://github.com/minishift/minishift/releases/download/v1.14.0/minishift-1.14.0-linux-amd64.tgz
tar zxvf minishift-1.14.0-linux-amd64.tgz
sudo mv minishift-1.14.0-linux-amd64/minishift /usr/local/bin/

minishift config set skip-check-kvm-driver true

minishift start
```
 * https://docs.openshift.org/latest/minishift/getting-started/quickstart.html
 * https://github.com/minishift/minishift/issues/2121
