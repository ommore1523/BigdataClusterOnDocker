FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openjdk-8-jdk \
      net-tools \
      curl \
      netcat \
      gnupg \
      libsnappy-dev \
      nano \
      wget \
      vim \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev \
       libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
       libncurses5-dev libncursesw5-dev xz-utils tk-dev

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS

RUN gpg --import KEYS

ENV HADOOP_VERSION 3.2.4

COPY hadoop-3.2.4.tar.gz /

RUN tar -xzvf hadoop-3.2.4.tar.gz

RUN mv hadoop-3.2.4 hadoop

RUN rm hadoop-3.2.4.tar.gz


# Spark Installation 
COPY spark.tgz /

RUN tar -xf spark.tgz

RUN mv spark-3.0.0-bin-hadoop3.2 /usr/bin/

RUN apt-get install -y curl python3 r-base
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN echo "alias pyspark=/usr/bin/spark-3.0.0-bin-hadoop3.2/bin/pyspark" >> ~/.bashrc
RUN echo "alias spark-shell=/usr/bin/spark-3.0.0-bin-hadoop3.2/bin/spark-shell" >> ~/.bashrc
RUN mkdir /usr/bin/spark-3.0.0-bin-hadoop3.2/logs
RUN rm spark.tgz

ENV SPARK_HOME /usr/bin/spark-3.0.0-bin-hadoop3.2
