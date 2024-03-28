FROM hive-base:0.2

LABEL Description="This is the  hive meta-store node for Hive Datawarehouse" \
      Author="Semesta Arus <bigdata0124@gmail.com>"

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 9083

HEALTHCHECK CMD netstat -tuplen | grep 9083 || exit 1

CMD startup.sh
