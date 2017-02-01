### install 
```
sudo yum install -y docker

sudo service docker start
sudo chkconfig docker on
```

### docker 
```
sudo docker pull centos:centos6
sudo docker pull ubuntu:latest

sudo docker pull nalbam/nalbam-docker

sudo docker images

sudo docker run -i -t --name centos centos /bin/bash
sudo docker run -i -t --name ubuntu ubuntu /bin/bash

sudo docker run -d -t -p 8080:80 --name nalbam nalbam/nalbam-docker /bin/bash

sudo docker ps
sudo docker ps -a

sudo docker stop nalbam
sudo docker start nalbam
sudo docker attach nalbam

sudo docker exec -it nalbam bash

sudo docker rm nalbam
sudo docker rmi nalbam:latest
```

 * https://www.docker.com/
 * https://registry.hub.docker.com/u/nalbam/nalbam-docker/
