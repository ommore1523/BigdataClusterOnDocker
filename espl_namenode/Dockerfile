FROM espl_base

RUN mkdir -p /data/nn_data/


ENV HADOOP_HOME /hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

COPY core-site.xml /hadoop/etc/hadoop/
COPY hdfs-site.xml /hadoop/etc/hadoop/
COPY mapred-site.xml /hadoop/etc/hadoop/
COPY yarn-site.xml /hadoop/etc/hadoop/

RUN hdfs namenode -format -force

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh


ENV SPARK_MASTER_HOST 192.168.100.180
ENV SPARK_MASTER_PORT 8112
ENV SPARK_MASTER_WEBUI_PORT 8113
ENV PYSPARK_PYTHON python3
