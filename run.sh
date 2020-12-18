#!/bin/bash
read -p "py37 container will be removed. Continue (y/n)?" CONT
if [ "$CONT" != "y" ]; then
  exit 0
fi

sudo docker rm -f py37
sudo docker run -it -v /home/ubuntu/docker/python/py37:/root/py37 -v /home/ubuntu/docker/python/data:/root/data --name py37 crazyj7/ubuntu16.04-python3.7

