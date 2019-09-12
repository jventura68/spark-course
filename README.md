# spark-course

This docker is build from jupyter/pyspark-notebook, you can read this documentation for more options
https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html

### User enabled from docker after the start is jovyan, pass = ''

### run docker without password or token in jupyter notebook add "--NotebookApp.token=''" param to start-notebook.sh
```
docker run --name spark -d -p 8888:8888 jventuraroda/spark-course start-notebook.sh
```

Another usefull docker start options:
* -e JUPYTER_ENABLE_LAB=yes, enable Jupyter Labs interface
* -e GRANT_SUDO=yes , used with --user root to enable sudo for jovyan user
