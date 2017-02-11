
 * https://www.elastic.co/kr/products

### download
```
wget https://artifacts.elastic.co/downloads/logstash/logstash-5.2.0.tar.gz
```

### config
```
input {
  exec {
    command => "free | grep 'Mem: ' | awk '{print int($3/($3+$4)*100)}'"
    interval => "10"
    type => "mem"
  }
  exec {
    command => "cat /proc/stat | grep 'cpu ' | awk '{print int(($2+$3+$4)/($2+$3+$4+$5)*100)}'"
    interval => "10"
    type => "cpu"
  }
  exec {
    command => "df -k | grep '/dev/sda3 ' | awk '{print ($5*1)}'"
    interval => "10"
    type => "hdd"
  }
  file {
    path => "/var/log/httpd/access.log"
    type => "apache"
  }
}
filter {
  geoip {source => “clientip”}
}
output {
  elasticsearch { hosts => ["localhost:9200"] }
  stdout { codec => rubydebug }
}
```

### start 
```
nohup bin/logstash -f logstash.conf &
```
