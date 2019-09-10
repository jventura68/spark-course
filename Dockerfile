# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/pyspark-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jose Ventura<jose.ventura.roda@gmail.com>"

USER root
env PATH $PATH:$SPARK_HOME/bin

#Copy files for course
ADD files /home/$NB_USER

RUN chown -R $NB_UID:$NB_GID /home/$NB_USER/data && \
    chown -R $NB_UID:$NB_GID /home/$NB_USER/src

USER $NB_UID
