
 * https://www.elastic.co/kr/products

### download
```
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.2.1.zip
```

### env
```
sudo vi /etc/security/limits.conf

ec2-user hard nofile 65536
ec2-user soft nofile 65536
ec2-user hard nproc 65536
ec2-user soft nproc 65536

sudo vi /etc/rc.local

echo 1048575 > /proc/sys/vm/max_map_count

sudo reboot 0
```

### config
```
# network
network.host: 0.0.0.0

# cors
http.cors.enabled: true
http.cors.allow-origin: /https?:\/\/localhost(:[0-9]+)?/

# cors X-Pack
http.cors.allow-credentials: true
http.cors.allow-headers: X-Requested-With,X-Auth-Token,Content-Type,Content-Length,Authorization
```

### start
```
bin/elasticsearch -d
```

### plugin
```
git clone git://github.com/mobz/elasticsearch-head.git
cd elasticsearch-head
npm install
grunt server
open http://localhost:9100/
```

### search
```
http://localhost:9200/_search?q=name:변강쇠
http://localhost:9200/test/_search?q=name:변강쇠 AND birth:1980*&sort=reg_time:desc&from=0&size=10
http://localhost:9200/test/_search?source={"query":{"match":{"name":"변강쇠"}}}
```

### mapping
```
curl -XPUT http://localhost:9200/test -d '
{
    "mappings": {
        "account": {
            "properties": {
                "location": {"type": "geo_point"}
            }
        }
    }
}
'
```

### geo search
```
curl -XGET 'http://localhost:9200/test/_search?pretty' -d '
{
  "sort": [
    {
      "_geo_distance": {
        "location": {
          "lat": 37.0,
          "lon": 126.0
        },
        "order": "asc",
        "unit": "km"
      }
    }
  ],
  "query": {
    "filtered": {
      "query": {
        "match_all": {}
      },
      "filter": {
        "geo_distance": {
          "distance" : "50km",
          "location": {
            "lat": 37.0,
            "lon": 126.0
          }
        }
      }
    }
  }
}
'
```
