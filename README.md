## Zookeeper Server Image

### Build the Container

```bash
git clone git://github.com/ezhaar/docker-kafka
cd docker-kafka
docker build . -t izhar/kafka

```

### Start Zookeeper Server

```bash

docker run -d --name zk --hostname zk izhar/zookeeper

# get the ip address of zk
docker inspect zk | grep -i ip

```

### Creating multiple containers

```bash
docker run -d --name k0 --hostname k0 -e BROKERID=0 -e ZKHOST=<zk_ip> izhar/kafka
docker run -d --name k1 --hostname k1 -e BROKERID=1 -e ZKHOST=<zk_ip> izhar/kafka
docker run -d --name k2 --hostname k2 -e BROKERID=2 -e ZKHOST=<zk_ip> izhar/kafka

# connect an interactive shell on the running container
docker exec -it k0 /bin/bash
```

### Create Topic and Start Sending/Receiving Events
```bash
docker exec k0 /kafka_2.10-0.9.0.1/bin/kafka-topics.sh --create --zookeeper 172.17.0.2:2181 --replication-factor 1 --partitions 1 --topic test

# Enter the producer container
docker exec -it k0 /bin/bash
# publish messages
/kafka_2.10-0.9.0.1/bin/kafka-console-producer.sh --broker-list 172.17.0.3:9092 --topic test

# test from another terminal to see that we can consume msgs
docker exec k0 /kafka_2.10-0.9.0.1/bin/kafka-console-consumer.sh --bootstrap-server 172.17.0.3:9092 --topic test --zookeeper 172.17.0.2:2181 --from-beginning
```
