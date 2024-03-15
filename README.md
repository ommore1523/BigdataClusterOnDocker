# Custome Practice Hadoop/Spark Cluster Setup for 3X versions:

## Steps :

### VVIMM
```bash
export `SPARK_LOCAL_HOSTNAME=192.168.100.40`
spark-submit <your_spark_application.py> <arguments>
```


## Common:

- After each container up add `192.168.100.180 espl.hadoop.com` to /etc/hosts file of container 

#### 1. Base Image Build steps:

- Visit to espl_base dir
- Run `docker build -t espl_base . ` This will create espl_base image 

#### 2. Master Node Build Steps:

- Visit to espl_namenode dir
- run `curl https://downloads.apache.org/hadoop/common/hadoop-3.2.4/hadoop-3.2.4.tar.gz ` which will download `hadoop-3.2.4.tar.gz`
- run `curl https://archive.apache.org/dist/spark/spark-3.0.0/spark-3.0.0-bin-hadoop3.2.tgz -o spark.tgz`
- Run `docker build -t espl_namenode . ` This will create espl_namenode image.
- *NOTE : hadoop master, hadoop resourcemanager, hadoop historyserver, spark master will setup on this container*
- Create Container : `docker container run -it --network host --cpus=4 --memory=8g --hostname espl.hadoop.com --name espl_namenode espl_namenode` .This will create container.
- `docker container exec -it espl_namenode bash` Enter into container.
- `./entrypoint.sh` This will up all services

- `http://127.0.0.1:8100/`  Namenode URL
- `http://127.0.0.1:8103/`  HistoryServer URL
- `http://127.0.0.1:8106/`  ResourceManager URL
- `http://127.0.0.1:8113/`  SparkMaster URL


#### 3. Worker Node Build Steps:
- Visit to espl_datanodeX dir
- Run `docker build -t espl_datanode1 . ` This will create espl_namenode image.
- *NOTE : hadoop worker, hadoop nodemanager, spark worker will setup on this container*
- Create Container : `docker container run -it --network host --cpus=4 --memory=8g --hostname espl.hadoop.com --name espl_datanode1 espl_datanode1` .This will create container.
- `docker container exec -it espl_datanode1 bash` Enter into container.
- `./entrypoint.sh` This will up all services

- `http://127.0.0.1:8120/` Datanode1 URL
- `http://127.0.0.1:8127/` SparkWorker1 URL
- `http://127.0.0.1:8123/` NodeManager URL


#### 3. Secondary Name Node Build Steps:
- Visit espl_secondary_namenode
- `docker build -t espl_snn .`
- `docker container run -itd --network host --cpus=4 --memory=8g --hostname espl.hadoop.com --name espl_snn espl_snn`
- `docker container exec -it espl_snn bash`
- `./entrypoint.sh`

- `http://127.0.0.1:8114/`






