
 * https://www.elastic.co/kr/products

### download
```
wget https://artifacts.elastic.co/downloads/logstash/logstash-5.2.1.tar.gz
```

### config
```
input {
  file {
    path => "/data/logs/*.json"
    type => apache
    codec => json
  }
}
filter {
  geoip {
    source => "clientip"
  }
}
output {
  elasticsearch {
    hosts => ["localhost:9200"]
  }
  stdout { codec => rubydebug }
}
```

### start 
```
nohup bin/logstash -f logstash.conf &
```

### clear
```
curl -XDELETE http://localhost:9200/logstash*
```
