
 * https://www.elastic.co/kr/products

### download
```
wget https://artifacts.elastic.co/downloads/kibana/kibana-5.2.1-linux-x86_64.tar.gz
```

### config
```
vi config/kibana.yml

elasticsearch.url: "http://localhost:9200"
```

### start 
```
nohup bin/kibana &
```

### status
```
ps -ef | grep node
```
