# Kafka Image

## Using Docker Compose:
- Install docker-compose:
```bash
pip install docker-compose
```
### Build the Container

```bash
git clone git://github.com/ezhaar/docker-kafka
cd docker-kafka
docker build . -t kafka
```

### Start Everything
```bash
cd docker-kafka
docker-compose up -d
```
This will start a single instance of zookeeper and kafka.

### Create more kafka instances:
```bash
docker-compose scale kafka=3
```

### Create Topic and Start Sending/Receiving Events
```bash
docker exec <kafka_container> /kafka_2.10-0.10.1.0/bin/kafka-topics.sh --create --zookeeper <zookeeper_ip>:2181 --replication-factor 1 --partitions 1 --topic test

# Enter the producer container
docker exec -it <kafka_container> /bin/bash
# publish messages
/kafka_2.10-0.10.1.0/bin/kafka-console-producer.sh --broker-list kafka:9092 --topic test

# test from another terminal to see that we can consume msgs
docker exec <kafka_container> /kafka_2.10-0.10.1.0/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic test --zookeeper zookeeper:2181 --from-beginning
```
