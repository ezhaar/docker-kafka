#!/bin/bash
if [[ -z "$BROKERID" ]]; then
    # By default auto allocate broker ID
    export BROKERID=-1
if [[ -z "$KAFKA_PORT" ]]; then
    export KAFKA_PORT=9092

if [[ -z "$ZKHOST" ]]; then
    export ZKHOST=zookeeper:2181

sed -i s/localhost:2181/$ZKHOST/g $KAFKA_HOME/config/server.properties
sed -i s/broker.id=0/broker.id=-1/g $KAFKA_HOME/config/server.properties
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
