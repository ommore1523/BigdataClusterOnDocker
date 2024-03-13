FROM espl_base

RUN mkdir -p /data/dn_data/
RUN mkdir -p /data/dn_local
RUN mkdir -p /data/dn_log

ENV HADOOP_HOME /hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV HADOOP_CONF_DIR  $HADOOP_HOME/etc/hadoop

COPY core-site.xml /hadoop/etc/hadoop/
COPY hdfs-site.xml /hadoop/etc/hadoop/
COPY yarn-site.xml /hadoop/etc/hadoop/

RUN hdfs namenode -format -force

COPY entrypoint.sh /

RUN chmod a+x /entrypoint.sh


ENV SPARK_WORKER_MEMORY 8g
ENV SPARK_WORKER_PORT 8136 
ENV SPARK_WORKER_WEBUI_PORT 8137
ENV SPARK_WORKER_CORES 4
