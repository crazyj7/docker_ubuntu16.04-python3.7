#!/bin/bash
docker run -it -v /home/psychic/storage/hub/docker_ubuntu16.04-python3.7/py37:/root/py37 -p 8888:8888 crazyj7/ubuntu16.04-python3.7 jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token='' --NotebookApp.password=''

