#!/bin/bash
sed -i s/localhost:2181/$ZKHOST:2181/g $KAFKA_HOME/config/server.properties
sed -i s/broker.id=0/broker.id=$BROKERID/g $KAFKA_HOME/config/server.properties
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
