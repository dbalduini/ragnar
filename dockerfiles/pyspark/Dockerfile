FROM ragnar/spark

ARG spark_dir

RUN mkdir ${SPARK_HOME}/python

RUN apk add --no-cache python && \
    apk add --no-cache python3 && \
    python -m ensurepip && \
    python3 -m ensurepip && \
    # We remove ensurepip since it adds no functionality since pip is
    # installed on the image and it just takes up 1.6MB on the image
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    # You may install with python3 packages by using pip3.6
    # Removed the .cache to save space
    rm -r /root/.cache

RUN mv /tmp/${spark_dir}/python/lib ${SPARK_HOME}/python/lib

ENV PYTHONPATH ${SPARK_HOME}/python/lib/pyspark.zip:${SPARK_HOME}/python/lib/py4j-*.zip

COPY ./dockerfiles/pyspark/entrypoint.sh /opt/entrypoint.sh

WORKDIR /opt/spark/work-dir

ENTRYPOINT [ "/opt/entrypoint.sh" ]
