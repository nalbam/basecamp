# HTTPie
 * https://httpie.org/

## mac
```
brew install httpie
```

## centos 6
```
sudo yum install -y python-pip
sudo pip install httpie
```

## usage
```
http POST http://demo.nalbam.com/users id=001 name=nalbam

http --form POST demo.nalbam.com name='nalbam'

http -a username:password demo.nalbam.com

http --verify=no https://demo.nalbam.com

http 10.111.3.157 Referer:jenkins.apps.nalbam.com
```
