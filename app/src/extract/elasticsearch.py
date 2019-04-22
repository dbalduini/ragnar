import os


def write(dataframe, index):
    """
    Write data into ElasticSearch.

    Args:
        dataframe: The spark dataframe.
        index (str): The elasticsearch index.
    """
    host = os.getenv("ELASTICSEARCH_HOST", "localhost")
    port = os.getenv("ELASTICSEARCH_PORT", "9200")
    dataframe.write\
        .format("org.elasticsearch.spark.sql")\
        .option("es.nodes", host)\
        .option("es.port", port)\
        .option("es.resource", index)\
        .save()
