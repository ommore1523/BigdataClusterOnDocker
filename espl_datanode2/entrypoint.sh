#!/bin/bash

hdfs --daemon start datanode;

yarn --daemon start nodemanager;


echo -e "192.168.100.180 espl.hadoop.com" >> /etc/hosts
echo -e "192.168.100.40 expansive" >> /etc/hosts

cd /usr/bin/spark-3.0.0-bin-hadoop3.2/sbin;

./start-slave.sh spark://192.168.100.180:8112 -h 192.168.100.180