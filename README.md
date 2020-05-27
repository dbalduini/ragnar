## ragnar

Ragnar is an ETL tool for Big Data on top of only open-source tools like:

- Spark
- Docker
- Elasticsearch
- Kibana
- Numpy
- Pandas
- Jupyter notebook

# datasources

https://www.kaggle.com/zynicide/wine-reviews/version/4#

ftp://ita.ee.lbl.gov/html/contrib/NASA-HTTP.html

# Development

## Code Style

We use a Code-Style based on [PEP8](https://www.python.org/dev/peps/pep-0008). 

The tool we use for linting is called [flake8](http://flake8.pycqa.org/en/latest/index.html#quickstart).

It is also recommended to activate a virtualenv to keep the house clean.

### Dev env setup example on Windows 10

First, enter the source folder.

```
cd src
```

On Windows 10, it is only safe to use `virtualenv` on cmd prompt.

```
virtualenv .venv

.venv\Scripts\activate.bat
```

After activating the virtual env, install pip requirements to run linter and tests locally.

```
pip install -r requirements.txt
```

To leave the virtualenv:

```
deactivate
```

## Code linter

```
flake8 app
```

It is recommended to setup your IDE to also use the flake8 linter.

## Testing

On the _app_ folder, execute the command below:

```
set PYTHONPATH="%cd%"

python -m pytest tests
```

# Docker, Docker-Compose and Kubernetes

## Initial Setup

**It is necessary to build the following three images before running docker-compose.**

The order is important.

Build **ragnar/spark** image.

```
.\bin\docker_build_spark.ps1
```

Build **ragnar/pyspark** image.

```
.\bin\docker_build_pyspark.ps1
```

Build the application base image: **ragnar/app** image.

The base image is required for the **ragnar/app/notebook** image.

```
.\bin\docker_build_app.ps1
```

### Docker Compose

Raise a local environment for development and data exploration.

```
docker-compose up
```

- Kibana: `http://localhost:5601`
- Elasticsearch: `http://localhost:9200`
- Jupyter Notebook: `http://localhost:8888`

__Jupyter__: Since the volume is binded by docker-compose, everything is automatically saved on the folder notebooks. So no manual job is required here.

__Kibana__: It is necessary to manualy Export and Import saved objects. Every kibana object should be saved on the folder *kibana*.

__Elasticsearch__: All data saved into elasticseach will be lost when the container dies.

## Spark

Running Spark (Scala) in interactive-mode.

```
docker run --rm -it ragnar/spark
```

## PySpark

Running Spark (Python) in interactive-mode.

```
docker run --rm -it --entrypoint "/bin/bash" ragnar/pyspark
```

## F.A.Q

### How to share volume on windows docker-machine ?

Share the hole project path with the VirtualBox.

This will let we access the folders inside the ragnar project (eg: /ragnar/notebooks).

```
docker-machine stop

vboxmanage sharedfolder add default --name "ragnar" --hostpath "D:\Projetos\ragnar" --automount

docker-machine start
```

### Cant access my services on localhost

If you are using the docker-machine, you need to replace the localhost for the virtual machine ip (eg: 192.168.99.100).

--------------------------------

## External Resources

**SPARK**
- [Spark Docs](https://spark.apache.org/docs/2.4.0/api/python/pyspark.sql.html)
- [Write CSV Files](https://dzone.com/articles/spark-write-csv-file)
- [Submitting Apps](https://spark.apache.org/docs/latest/submitting-applications.html)
- [Spark DataFrame Tutorial](https://www.analyticsvidhya.com/blog/2016/10/spark-dataframe-and-operations/)

**TESTS**
- [PyTest & Mock](https://docs.python.org/dev/library/unittest.mock.html)
