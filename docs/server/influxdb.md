# influxdb

## Install InfluxDB on Amazon Linux 2

```bash
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL 7
baseurl = https://repos.influxdata.com/rhel/7/x86_64/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF

sudo yum update
sudo yum list | grep influxdb

sudo yum install -y influxdb

sudo systemctl start influxdb
sudo systemctl enable influxdb
systemctl status influxd
```

## sample

```
curl -G http://localhost:8086/query --data-urlencode "q=SHOW DATABASES"
```
