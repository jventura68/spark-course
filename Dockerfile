# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/pyspark-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jose Ventura<jose.ventura.roda@gmail.com>"

USER root
env PATH $PATH:$SPARK_HOME/bin

SHELL ["/bin/bash", "-c"]

#Copy files for course
# files directory and subdirectories must be read for all users
# if not, the chown command not run correctly
ADD files /home/$NB_USER
COPY jupyter_notebook_config.py /home/$NB_USER/.jupyter

RUN chown -R $NB_UID:$NB_GID /home/$NB_USER/data && \
    chown -R $NB_UID:$NB_GID /home/$NB_USER/src  && \
	chown -R $NB_UID:$NB_GID /home/$NB_USER/.jupyter/jupyter_notebook_config.py
	
USER $NB_USER
