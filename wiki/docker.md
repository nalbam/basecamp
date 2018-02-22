### install 
```
sudo yum install -y docker

sudo service docker start
sudo chkconfig docker on
```

### docker 
```
sudo docker pull mysql
sudo docker pull redis

sudo docker pull nalbam/nalbam-docker

sudo docker images

sudo docker run -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest
sudo docker run -p 6379:6379 --name redis -d redis:latest

sudo docker run -d -t -p 8888:80 --name nalbam nalbam/nalbam-docker /bin/bash

sudo docker ps
sudo docker ps -a

sudo docker stop nalbam
sudo docker start nalbam
sudo docker attach nalbam

sudo docker exec -it nalbam bash

sudo docker rm nalbam
sudo docker rm $(docker ps -a -q)

sudo docker rmi nalbam:latest
sudo docker rmi $(docker images -q)
```

## elk
```
sudo docker pull sebp/elk
sudo docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk
```

 * https://www.docker.com/
 * https://registry.hub.docker.com/u/nalbam/nalbam-docker/
