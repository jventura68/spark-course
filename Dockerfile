# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/pyspark-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jose Ventura<jose.ventura.roda@gmail.com>"

USER root
env PATH $PATH:$SPARK_HOME/bin
env SPARK_DATA /home/$NB_USER/work/data
env SPARK_LOG_LEVEL ERROR

#Create spark log conf file and change log level
RUN sed 's/log4j.rootCategory=INFO/log4j.rootCategory=$SPARK_LOG_LEVEL/' \
       $SPARK_HOME/conf/log4j.properties.template > \
       $SPARK_HOME/conf/log4j.properties

USER $NB_UID
RUN conda install --quiet --yes \
    'kafka-python' \
    && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
