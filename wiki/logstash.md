
 * https://www.elastic.co/kr/products

### download
```
wget https://artifacts.elastic.co/downloads/logstash/logstash-5.2.0.tar.gz
```

### config
```
input {
  file {
    path => "/data/logs/*.json"
    type => "apache"
  }
}
filter {
  geoip {
    source => "client"
    target => "geoip"
    database => "/data/pds/GeoLite2-City.mmdb"
  }
}output {
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
