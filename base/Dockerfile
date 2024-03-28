FROM ubuntu:18.04
LABEL Description="This is a base image for BigData Cluster Nodes" \
      Author="Semesta Arus <bigdata0124@gmail.com>"


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	build-essential \
        curl \
        gcc \
        g++ \
        subversion \
        python3-dev \
        gfortran \
        build-essential \
        libopenblas-dev \
        liblapack-dev \
        libqpdf-dev \
        pkg-config \
        libzbar-dev \
        python3-dev \
        libpython3-dev \
        qpdf \
        xvfb \
        gconf-service \
        libasound2 \
        libatk1.0-0 \
        libcairo2 \
        libcups2 \
        libfontconfig1 \
        libgdk-pixbuf2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libpango-1.0-0 \
        libxss1 \
        fonts-liberation \
        libappindicator1 \
        libnss3 \
        lsb-release \
        xdg-utils \
	git \
        less \
        nano \
        sudo \
        netcat \
	net-tools \
        iputils-ping \
        software-properties-common \
        wget

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openjdk-11-jdk

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	python3.6 \
	python3.6-dev \
	python3-pip \
	python3.6-venv


# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*