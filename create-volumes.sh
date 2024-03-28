#!/bin/bash

#This will create volume from cluster volumes to reinitialise the cluster deployment.

sudo mkdir -p /data1/dockervolumes/postgres/pgdata
sudo mkdir -p /data1/dockervolumes/redis/data
sudo mkdir -p /data1/dockervolumes/airflow/dags
sudo mkdir -p /data1/dockervolumes/airflow/logs
sudo mkdir -p /data1/dockervolumes/hadoop/nn
sudo mkdir -p /data1/dockervolumes/spark/master/logs
sudo mkdir -p /data1/dockervolumes/yarn/hs
sudo mkdir -p /data2/dockervolumes/hadoop/dn1 /data2/dockervolumes/hadoop/dn2 /data2/dockervolumes/hadoop/dn3
sudo mkdir -p /data2/dockervolumes/spark/worker1/logs /data2/dockervolumes/spark/worker2/logs /data2/dockervolumes/spark/worker3/logs
sudo mkdir -p /data1/dockervolumes/zookeeper/zknode1/data /data1/dockervolumes/zookeeper/zknode2/data /data1/dockervolumes/zookeeper/zknode3/data
sudo mkdir -p /data1/dockervolumes/zookeeper/zknode1/log /data1/dockervolumes/zookeeper/zknode2/log /data1/dockervolumes/zookeeper/zknode3/log
sudo chown root -R /data1/dockervolumes /data2/dockervolumes
sudo chmod 777 -R /data1/dockervolumes /data2/dockervolumes
	