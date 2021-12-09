ARG BASE_CONTAINER=jupyter/pyspark-notebook
FROM $BASE_CONTAINER

USER root

#Create spark log conf file and change log level to ERROR
RUN sed 's/log4j.rootCategory=INFO/log4j.rootCategory=ERROR/' \
       $SPARK_HOME/conf/log4j.properties.template > \
       $SPARK_HOME/conf/log4j.properties

USER $NB_UID

# Install pyarrow
RUN conda install --quiet -y 'kafka-python' 'boto3' 'beautifulsoup4' 'findspark' && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER