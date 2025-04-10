# docker

## install

```bash
sudo apt-get remove docker docker-engine docker.io

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce
```

## build

```bash
docker build -t nalbam/sample-timcat .
docker push nalbam/sample-timcat
```

## usage

```bash
docker pull mysql
docker pull redis

docker pull nalbam/sample-tomcat

docker images

docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest
docker run --name redis -p 6379:6379 -d redis:latest

docker run --name sample-tomcat -p 8080:8080 -d nalbam/sample-tomcat

docker ps
docker ps -a

docker stop sample-tomcat
docker start sample-tomcat
docker attach sample-tomcat

docker exec -it sample-tomcat bash
```

## cleanup

```bash
docker rm nalbam
docker rm $(docker ps -a -q)
docker rm $(docker ps -a -q -f status=dead)

docker rmi -f nalbam:latest
docker rmi -f $(docker images -q)

docker system prune
docker container prune
docker image prune
docker volume prune
docker network prune
```

* <https://www.docker.com/>
* <https://hub.docker.com/u/nalbam/>
* <https://docs.docker.com/install/linux/docker-ce/ubuntu/>
