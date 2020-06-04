FROM ubuntu:16.04
MAINTAINER crazyj7@gmail.com
RUN apt-get update -y
RUN apt-get upgrade -y
#RUN apt-get install -y build-essential binutils libtool make gcc g++ openjdk-8-jdk git dos2unix vim wget 
RUN apt-get install -y build-essential wget vim dos2unix
RUN apt-get install -y zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget software-properties-common
RUN apt-get install -y ocl-icd-opencl-dev

RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update -y
RUN apt-get install -y python3.7

# env
WORKDIR /root
ENV HOME /root

RUN apt-get install -y python3.7-venv
RUN python3.7 -m venv py37

#RUN rm /bin/sh && ln -s /bin/bash /bin/sh
SHELL ["/bin/bash", "-c"]
RUN echo "source /root/py37/bin/activate" >> .bashrc
CMD ["/bin/bash"]

