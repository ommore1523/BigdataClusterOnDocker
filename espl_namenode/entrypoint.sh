#!/bin/bash


hdfs --daemon start namenode;

yarn --daemon start resourcemanager;


cd /hadoop/sbin;
./mr-jobhistory-daemon.sh start historyserver;

cd /usr/bin/spark-3.0.0-bin-hadoop3.2/sbin;

./start-master.sh;

cd /
