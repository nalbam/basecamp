```
sudo yum install -y puppet-server
sudo yum install -y puppet
```

```
sudo vi /etc/puppet/puppet.conf

[master]
    certname = io.nalbam.com

[agent]
    certname = s1.nalbam.com
```

```
puppet master
puppet master --no-daemonize --verbose --debug

puppet cert list --all
puppet cert sign 

puppet agent --server master.example.com --no-daemonize --verbose

puppet module install puppetlabs-apache
puppet module install puppetlabs-java
```
