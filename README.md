# Kafka Image

## 1. Using Docker Compose:
- Install docker-compose:
```bash
pip install docker-compose
```
### 2. Build the Container

```bash
git clone git://github.com/ezhaar/docker-kafka
cd docker-kafka
docker build . -t izhar/kafka_211
```

### 3. Build Zookeeper
If you havent build zookeeper image already, please follow the following steps, otherwise move on to step 4.
```bash
git clone git://github.com/ezhaar/docker-zookeeper
cd docker-zookeeper
docker build . -t izhar/zookeeper
```

### 4. Start Everything
```bash
cd docker-kafka
docker-compose up -d
```
This will start a single instance of zookeeper and kafka.

### 5. Create more kafka instances:
```bash
docker-compose scale kafka=3
```

### 6. Create Topic and Start Sending/Receiving Events
```bash
docker exec <kafka_container> /kafka_2.11-0.10.2.0/bin/kafka-topics.sh --create --zookeeper <zookeeper_ip>:2181 --replication-factor 1 --partitions 1 --topic test

# Enter the producer container
docker exec -it <kafka_container> /bin/bash
# publish messages
/kafka_2.11-0.10.2.0/bin/kafka-console-producer.sh --broker-list kafka:9092 --topic test

# test from another terminal to see that we can consume msgs
docker exec <kafka_container> /kafka_2.11-0.10.2.0/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic test --from-beginning
```
