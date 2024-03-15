#!/bin/bash


echo -e "192.168.100.180 espl.hadoop.com" >> /etc/hosts
echo -e "192.168.100.40 expansive" >> /etc/hosts

hdfs --daemon start secondarynamenode