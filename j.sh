#!/bin/bash
docker rm -f py37
docker run -d -v /home/ubuntu/docker/python/py37:/root/py37 -v /home/ubuntu/docker/python/data:/root/data -p 8888:8888 --name py37 crazyj7/ubuntu16.04-python3.7 jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token='' --NotebookApp.password='sha1:c067657d688c:fd029cbd8364e1a3dd1d342ae8f876c7b897f02d'

