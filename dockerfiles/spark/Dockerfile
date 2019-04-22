FROM openjdk:8-alpine

ARG spark_version=spark-2.4.1
ARG spark_dir=${spark_version}-bin-hadoop2.7
ARG spark_mirror=http://ftp.unicamp.br/pub/apache/spark/${spark_version}/${spark_dir}.tgz

# Setup spark env
RUN set -ex && \
    apk upgrade --no-cache && \
    apk add --no-cache bash tini libc6-compat linux-pam && \
    mkdir -p /opt/spark && \
    mkdir -p /opt/spark/work-dir && \
    touch /opt/spark/RELEASE && \
    rm /bin/sh && \
    ln -sv /bin/bash /bin/sh && \
    echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su && \
    chgrp root /etc/passwd && chmod ug+rw /etc/passwd

WORKDIR /tmp

# Download Spark
RUN wget -q ${spark_mirror} && \
    tar zxf ${spark_dir}.tgz && \
    mv ${spark_dir}/jars /opt/spark/jars && \
    mv ${spark_dir}/bin /opt/spark/bin && \
    mv ${spark_dir}/sbin /opt/spark/sbin && \
    mv ${spark_dir}/data /opt/spark/data

ENV SPARK_HOME /opt/spark
ENV SPARK_WORKDIR /opt/spark/work-dir

WORKDIR /opt/spark/work-dir
