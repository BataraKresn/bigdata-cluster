FROM bigdata-baseimg:0.2

# Update Python version
RUN apt-get update && apt-get install -y python3.7 python3-pip

# Install setuptools
RUN python3.7 -m pip install --upgrade pip setuptools

# Pin SQLAlchemy version to <2.0 and install other dependencies
RUN python3.7 -m pip install 'sqlalchemy<2.0' 'cryptography==3.4.8'

# Set environment variables
ENV LC_ALL=C.UTF-8
ENV LANG=en_US.UTF-8
ENV SQLALCHEMY_SILENCE_UBER_WARNING=1
ENV SQLALCHEMY_WARN_20=1
ENV PYTHONWARNINGS="ignore:MovedIn20Warning"

# Airflow Config
ARG AIRFLOW_VERSION=2.2.3
ARG AIRFLOW_USER_HOME=/home/airflow
ARG AIRFLOW_DEPS=""
ARG PYTHON_DEPS=""
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}
ENV AIRFLOW_DAG=${AIRFLOW_HOME}/dags
ENV AIRFLOW_LOG=${AIRFLOW_HOME}/logs

# Install Airflow and other Python dependencies
ARG AIRFLOW_VERSION=2.2.3
RUN python3.7 -m pip install \
    apache-airflow==$AIRFLOW_VERSION \
    celery[redis]==4.1.1 \
    psycopg2-binary \
    "SQLAlchemy<2.0" \
    connexion[swagger-ui] \
    pyOpenSSL \
    ndg-httpsclient \
    pyasn1 \
    apache-airflow-providers-redis \
    jinja2==2.11.3 \
    markupsafe==2.0.1

# Copy airflow.cfg
COPY airflow.cfg /home/airflow/airflow.cfg

# Create airflow user and set permissions
RUN useradd -ms /bin/bash -d /home/airflow airflow \
    && chown -R airflow: /home/airflow

# Add commands to create airflow user and set permissions
# Replace <USERNAME>, <FIRST_NAME>, <LAST_NAME>, and <EMAIL> with actual values
# RUN airflow users create \
#     --username mybigdata \
#     --firstname John \
#     --lastname Data \
#     --role Admin \
#     --email bigdata0124@gmail.com

# Modify airflow.cfg using sed commands
RUN sed -i 's/^xcom_backend =.*/xcom_backend = airflow.providers.redis.xcom.RedisXCom/' /home/airflow/airflow.cfg && \
    sed -i 's/^result_backend =.*/result_backend = db+redis:\/\/:@redis:6379\/0/' /home/airflow/airflow.cfg
