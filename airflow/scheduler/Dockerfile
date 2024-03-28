FROM  airflow-base:0.2 

LABEL Description="This is a Apache Airflow Scheduler node" \
      Author="Semesta Arus <bigdata0124@gmail.com>"

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

HEALTHCHECK --start-period=10s CMD [ -f ${AIRFLOW_HOME}/airflow.cfg ] || exit 1

USER airflow
WORKDIR ${AIRFLOW_HOME}

ENTRYPOINT ["/usr/local/bin/startup.sh"]