
 * https://www.elastic.co/kr/products

### download
```
wget https://artifacts.elastic.co/downloads/kibana/kibana-6.0.0-linux-x86_64.tar.gz
wget https://artifacts.elastic.co/downloads/kibana/kibana-5.2.1-linux-x86_64.tar.gz
wget https://download.elastic.co/kibana/kibana/kibana-4.6.4-linux-x86_64.tar.gz
```

### config
```
vi config/kibana.yml
```
```
server.host: "10.0.0.10"

elasticsearch.url: "http://localhost:9200"

elasticsearch.username: "user"
elasticsearch.password: "pass"
```

### start 
```
nohup bin/kibana &
```

### status
```
ps -ef | grep node
```
