FROM centos
MAINTAINER Izhar ul Hassan "ezhaar@gmail.com"

USER root

RUN yum update -y
RUN yum install -y java-1.8.0-openjdk-headless.x86_64
RUN yum clean all
RUN curl -o kafka_2.10-0.9.0.1.tgz http://apache.mirrors.spacedump.net/kafka/0.9.0.1/kafka_2.10-0.9.0.1.tgz
RUN tar -xzf kafka_2.10-0.9.0.1.tgz
RUN rm kafka_2.10-0.9.0.1.tgz
EXPOSE 9092
ENV KAFKA_HOME /kafka_2.10-0.9.0.1
ENV PATH $PATH:$KAFKA_HOME/bin
WORKDIR /

ENV TERM xterm
COPY run.sh /root/
CMD ["/root/run.sh"]

#ToDo:
#--env KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"
#advertised_host
# ip of producer must be known to kafka 
#setting to stop producers from creating topics by subscribing to a topic that doesnt exist
