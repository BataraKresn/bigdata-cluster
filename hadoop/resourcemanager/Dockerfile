FROM hadoop-base:0.2

LABEL Description="This is the ResourceManager Node for Hadoop Cluster" \
      Author="Semesta Arus <bigdata0124@gmail.com>"

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088

CMD ["/run.sh"]
