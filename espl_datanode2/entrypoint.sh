#!/bin/bash

hdfs --daemon start datanode;

yarn --daemon start nodemanager;


cd /usr/bin/spark-3.0.0-bin-hadoop3.2/sbin;

./start-slave.sh spark://0.0.0.0:8112