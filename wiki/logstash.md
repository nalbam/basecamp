
 * https://www.elastic.co/kr/products

### download
```
wget https://artifacts.elastic.co/downloads/logstash/logstash-5.2.0.tar.gz
```

### config
```
input {
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
