### install 
```
yum install docker-io

service docker start
chkconfig docker on
```

### docker 
```
docker pull centos:centos6
docker pull ubuntu:latest

docker pull nalbam/nalbam-docker

docker images

docker run -i -t --name centos centos /bin/bash
docker run -i -t --name ubuntu ubuntu /bin/bash

docker run -i -t -p 8080:80 --name nalbam nalbam/nalbam-docker /bin/bash

docker ps
docker ps -a

docker stop nalbam
docker start nalbam
docker attach nalbam

docker exec -it nalbam bash

docker rm nalbam
docker rmi nalbam:latest
```

 * https://www.docker.com/
 * https://registry.hub.docker.com/u/nalbam/nalbam-docker/
