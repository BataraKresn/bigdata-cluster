FROM  bigdata-baseimg:0.2

LABEL Description="This is a base image for Hadoop Cluster Nodes" \
      Author="Semesta Arus <bigdata0124@gmail.com>"
# Install dirmngr
RUN apt-get update && apt-get install -y dirmngr

# Import GPG keys
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys 07617D4968B34D8F13D56E20BE5AAA0BA210C095 2CAC83124870D88586166115220F69801F27E622 || \
    gpg --keyserver hkp://pgp.mit.edu --recv-keys 07617D4968B34D8F13D56E20BE5AAA0BA210C095 2CAC83124870D88586166115220F69801F27E622


ENV HADOOP_VERSION=3.3.6
ENV HADOOP_URL=https://www.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz

# Download and install Hadoop
RUN set -ex \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && curl https://downloads.apache.org/hadoop/common/KEYS | gpg --import - \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
# RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
# RUN cp /home/ubuntu/docker-bigdata-cluster/hadoop/base/mapred-site.xml /etc/hadoop/mapred-site.xml
COPY mapred-site.xml /etc/hadoop/mapred-site.xml

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs
RUN mkdir /hadoop-data

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

ADD entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
