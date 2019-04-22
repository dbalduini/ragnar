FROM ragnar/app

# Install Jupyter and its OS depedencies
RUN apk add --no-cache gcc python2-dev gcc g++ make linux-headers

RUN pip install jupyter && \
    pip install numpy && \
    pip install pandas

RUN mkdir -p /root/.jupyter

WORKDIR /opt/spark/work-dir

COPY ./dockerfiles/app-notebook/jupyter_notebook_config.py /root/.jupyter

ENV PYSPARK_DRIVER_PYTHON jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS 'notebook'

EXPOSE 8888

ENTRYPOINT ["/opt/spark/bin/pyspark"]
