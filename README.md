# spark-course

This docker is build from jupyter/pyspark-notebook, you can read its document for more options
https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html

**run docker without password or token in jupyter notebook add "--NotebookApp.token=''" param to start-notebook.sh**
'''
docker run --name spark -d -p 8888:8888 -e GRANT_SUDO=yes --user root jventuraroda/spark-course start-notebook.sh --NotebookApp.token=''
'''
