## Zookeeper Server Image

### Build the Container

```bash
git clone git://github.com/ezhaar/docker-zookeeper
cd docker-kafka
docker build . -t ezhaar/kafkaServer

```

### Start Zookeeper Server

```bash

docker run -d --name zk ezhaar/zookeeper

# get the ip address of zkserver
docker inspect zk | grep -i ip

```

### Testing from same container

```bash
docker run -d --name k0 -e BROKERID=<broker_ID> -e ZKHOST=<zk_ip> izhar/kafka

# connect an interactive shell on the running container
docker exec -it k0 /bin/bash
```


