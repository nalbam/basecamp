# prometheus

## Install Prometheus on Amazon Linux 2

```bash
sudo tee /etc/yum.repos.d/prometheus.repo <<EOF
[prometheus]
name=prometheus
baseurl=https://packagecloud.io/prometheus-rpm/release/el/7/x86_64
repo_gpgcheck=1
enabled=1
gpgkey=https://packagecloud.io/prometheus-rpm/release/gpgkey
       https://raw.githubusercontent.com/lest/prometheus-rpm/master/RPM-GPG-KEY-prometheus-rpm
gpgcheck=1
metadata_expire=300
EOF

sudo yum update
sudo yum list | grep prometheus

sudo yum install -y prometheus2 node_exporter

sudo systemctl restart prometheus node_exporter
sudo systemctl enable prometheus node_exporter
systemctl status prometheus node_exporter
```
