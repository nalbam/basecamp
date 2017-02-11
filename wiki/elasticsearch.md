### install 
```
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.2.0.zip
unzip elasticsearch-5.2.0.zip -d /data/apps/
```

### start 
```
/data/apps/elasticsearch-5.2.0/bin/elasticsearch
/data/apps/elasticsearch-5.2.0/bin/elasticsearch -d
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

 * https://www.elastic.co/kr/products/elasticsearch
