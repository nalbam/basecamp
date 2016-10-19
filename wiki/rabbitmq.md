### erlang
```
wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-1.0-1.noarch.rpm

sudo yum install -y erlang
```

### rabbitmq
```
sudo yum install -y socat

sudo rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc

wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.5/rabbitmq-server-3.6.5-1.noarch.rpm
sudo rpm -Uvh rabbitmq-server-3.6.5-1.noarch.rpm
```

### start
```
sudo chkconfig rabbitmq-server on
sudo service rabbitmq-server start
```

### plugins - management
```
sudo rabbitmq-plugins enable rabbitmq_management
```

### plugins - delayed_message
```
cd /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.1/plugins
wget http://www.rabbitmq.com/community-plugins/v3.6.x/rabbitmq_delayed_message_exchange-0.0.1.ez

sudo rabbitmq-plugins enable rabbitmq_delayed_message_exchange
```

### user
```
sudo rabbitmqctl add_user rabbitmq password
sudo rabbitmqctl set_user_tags rabbitmq administrator
```
