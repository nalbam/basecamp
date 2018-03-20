### install 
```
sudo yum install -y docker

sudo service docker start
sudo chkconfig docker on

sudo usermod -aG docker $USER
```

### docker 
```
sudo docker pull mysql
sudo docker pull redis

sudo docker pull nalbam/docker

sudo docker images

sudo docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest
sudo docker run --name redis -p 6379:6379 -d redis:latest

sudo docker run --name nalbam -p 80:80 -d nalbam/docker /bin/bash

sudo docker ps
sudo docker ps -a

sudo docker stop nalbam
sudo docker start nalbam
sudo docker attach nalbam

sudo docker exec -it nalbam bash
```

## cleanup
```
sudo docker rm nalbam
sudo docker rm $(sudo docker ps -a -q)

sudo docker rmi -f nalbam:latest
sudo docker rmi -f $(sudo docker images -q)

sudo docker system prune
sudo docker container prune
sudo docker image prune
sudo docker volume prune
sudo docker network prune
```

## elk
```
sudo docker pull sebp/elk
sudo docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk
```

 * https://www.docker.com/
 * https://registry.hub.docker.com/u/nalbam/
