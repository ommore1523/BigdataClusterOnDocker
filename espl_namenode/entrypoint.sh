#!/bin/bash


hdfs --daemon start namenode;

yarn --daemon start resourcemanager;



echo -e "192.168.100.180 espl.hadoop.com" >> /etc/hosts
echo -e "192.168.100.40 expansive" >> /etc/hosts

cd /hadoop/sbin;
./mr-jobhistory-daemon.sh start historyserver;

cd /usr/bin/spark-3.0.0-bin-hadoop3.2/sbin;

./start-master.sh;

cd /
