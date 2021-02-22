# grafana

## Install Grafana on Amazon Linux 2

```bash
sudo tee /etc/yum.repos.d/grafana.repo<<EOF
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

sudo yum update
sudo yum list | grep grafana

sudo yum install -y grafana

sudo systemctl enable --now grafana-server
systemctl status grafana-server
```
