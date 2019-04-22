FROM ragnar/pyspark

# jar versions
ARG elasticsearch_version=6.6.0
ARG hadoop_azure_version=2.7.1
ARG az_storage_version=2.0.0

# maven jar paths
ARG central_mvn=http://central.maven.org/maven2

ARG elasticsearch_mvn=${central_mvn}/org/elasticsearch/elasticsearch-hadoop/${elasticsearch_version}
ARG azure_mvn=${central_mvn}/org/apache/hadoop/hadoop-azure/${hadoop_azure_version}
ARG azure_storage_mvn=${central_mvn}/com/microsoft/azure/azure-storage/${az_storage_version}

# jar definitions
ARG elasticsearch_jar=elasticsearch-hadoop-${elasticsearch_version}.jar
ARG azure_jar=hadoop-azure-${hadoop_azure_version}.jar
ARG az_storage_jar=azure-storage-${az_storage_version}.jar

# add ElasticSearch support
RUN wget -q ${elasticsearch_mvn}/${elasticsearch_jar} && \
    mv ${elasticsearch_jar} ${SPARK_HOME}/jars

# add Azure support
RUN wget -q ${azure_mvn}/${azure_jar} && \
    mv ${azure_jar} ${SPARK_HOME}/jars

# add Azure BlobStorage support
RUN wget -q ${azure_storage_mvn}/${az_storage_jar} && \
    mv ${az_storage_jar} ${SPARK_HOME}/jars

ENV PYSPARK_FILES ${PYSPARK_FILES}:/opt/spark/work-dir/app
ENV PYTHONPATH ${PYTHONPATH}:/opt/spark/work-dir/app
ENV ENV_FILE staging.env
ENV PYTHONIOENCODING utf8

WORKDIR /opt/spark/work-dir/app

COPY ./requirements.txt .

RUN pip install -r requirements.txt
