FROM espl_base

RUN mkdir -p /data/nn_data/

ENV HADOOP_HOME /hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

COPY core-site.xml /hadoop/etc/hadoop/
COPY hdfs-site.xml /hadoop/etc/hadoop/

RUN hdfs namenode -format -force

COPY entrypoint.sh /

RUN chmod a+x /entrypoint.sh
