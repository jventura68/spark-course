# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/pyspark-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jose Ventura<jose.ventura.roda@gmail.com>"

USER root
env PATH $PATH:$SPARK_HOME/bin
env SPARK_DATA /home/$NB_USER/data

USER $NB_UID
RUN conda install --quiet --yes \
    'kafka-python' \
    && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
