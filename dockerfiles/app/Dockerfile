FROM ragnar/pyspark

ARG maven_repo=https://repo.maven.apache.org/maven2

WORKDIR /tmp

# install maven
RUN wget -q https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && \
    tar -zxf apache-maven-3.6.3-bin.tar.gz -C /opt
ENV M2_HOME /opt/apache-maven-3.6.3
ENV PATH "${M2_HOME}/bin:${PATH}"

# get dependencies
RUN mvn dependency:get -q -DremoteRepositories=${maven_repo} -Ddest=${SPARK_HOME}/jars  \
    -DgroupId=org.elasticsearch -DartifactId=elasticsearch-hadoop -Dversion=6.6.2 -Dtransitive=false

RUN mvn dependency:get -q -DremoteRepositories=${maven_repo} -Ddest=${SPARK_HOME}/jars \
    -DgroupId=org.apache.hadoop -DartifactId=hadoop-azure -Dversion=2.7.7 -Dtransitive=false

RUN mvn dependency:get -q -DremoteRepositories=${maven_repo} -Ddest=${SPARK_HOME}/jars \
    -DgroupId=com.microsoft.azure -DartifactId=azure-storage -Dversion=2.0.0 -Dtransitive=false

# config pyspark
ENV PYSPARK_FILES ${PYSPARK_FILES}:/opt/spark/work-dir/app
ENV PYTHONPATH ${PYTHONPATH}:/opt/spark/work-dir/app
ENV ENV_FILE staging.env
ENV PYTHONIOENCODING utf8

WORKDIR /opt/spark/work-dir/app

COPY ./requirements.txt .

RUN pip install -r requirements.txt
