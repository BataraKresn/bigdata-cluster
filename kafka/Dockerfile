FROM bigdata-baseimg:0.2

LABEL Description="This is an image for Kafka nodes" \
      Author="Semesta Arus <bigdata0124@gmail.com>"

ENV SCALA_VERSION=2.13
ENV KAFKA_VERSION=3.5.2
ENV KAFKA_HOME=/opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

# Download and install Kafka
RUN wget -q https://downloads.apache.org/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && \
    rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

# Add start script
ADD start-kafka.sh /usr/bin/start-kafka.sh
RUN chmod +x /usr/bin/start-kafka.sh

# Expose Kafka port
EXPOSE 9092

# Health check
HEALTHCHECK --start-period=10s CMD netstat -tupln | grep 9092 || exit 1

# Set entry point
ENTRYPOINT ["/usr/bin/start-kafka.sh"]