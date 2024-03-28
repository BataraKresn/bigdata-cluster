FROM bigdata-baseimg:0.2

LABEL Description="This is a base image for Spark Nodes" \
      Author="Semesta Arus <bigdata0124@gmail.com>"

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ENV SPARK_VERSION=3.4.2
ENV HADOOP_VERSION=3

# Download and install Spark
RUN set -ex \
    && SPARK_URL="https://downloads.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" \
    && for attempt in 1 2 3; do \
        curl -fSL "$SPARK_URL" -o /tmp/spark.tgz && break || \
        echo "Download failed (attempt $attempt), retrying..." && sleep 10; \
    done \
    && tar -xzf /tmp/spark.tgz -C /opt/ \
    && rm /tmp/spark.tgz

ENV SPARK_HOME /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV PATH $SPARK_HOME/bin:$PATH

# Copy configuration files
COPY hive-site.xml $SPARK_HOME/conf/
COPY core-site.xml $SPARK_HOME/conf/
COPY yarn-site.xml $SPARK_HOME/conf/

ENV HADOOP_CONF_DIR $SPARK_HOME/conf

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENV PYSPARK_PYTHON=python3.6
ENV PYTHONHASHSEED 1

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]