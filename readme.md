# Ubuntu 16.04 + python 3.7

+ Docker build
```
docker build -t crazyj7/ubuntu16.04-python3.7 .
```

+ Docker container launch
 + Windows 
```
# venv py37 launch. bash
docker run -it -v /c/hub/docker_ubuntu16.04-python3.7/py37:/root/py37 crazyj7/ubuntu16.04-python3.7
# jupyter notebook launch.  
docker run -it -v /c/hub/docker_ubuntu16.04-python3.7/py37:/root/py37 -p 8888:8888 crazyj7/ubuntu16.04-python3.7 jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token='' --NotebookApp.password=''
```
 + Linux
```
docker run -it -v /home/crazyj7/docker_ubuntu16.04-python3.7/py37:/root/py37 crazyj7/ubuntu16.04-python3.7
```
Make the long command to batch file or shell script file.


+ initvenv.sh script always launch. 
if you want to initialize all, remove py37 folder.

```
If py37/ exists then 
   launch venv py37 and bash shell.
else
   init venv py37 (python3.7)
   upgrade pip and install requirements.txt (packages)
   launch venv py37 and bash shell.
```

+ You can install another python packages. And it does NOT removed. 



```
+ Install New Package
c:\hub\docker_ubuntu16.04-python3.7>docker run -it -v /c/hub/docker_ubuntu16.04-python3.7/py37:/root/py37 crazyj7/ubuntu16.04-python3.7
(py37) root@3c4e19680b34:~# pip install jakecipher
Collecting jakecipher
  Downloading jakecipher-0.1.4-py3-none-any.whl (15 kB)
Requirement already satisfied: numpy in ./py37/lib/python3.7/site-packages (from jakecipher) (1.18.5)
Installing collected packages: jakecipher
Successfully installed jakecipher-0.1.4
(py37) root@3c4e19680b34:~# exit
exit

+ You can use the package in the new container.
c:\hub\docker_ubuntu16.04-python3.7>docker run -it -v /c/hub/docker_ubuntu16.04-python3.7/py37:/root/py37 crazyj7/ubuntu16.04-python3.7
(py37) root@cf33c4cfb1e4:~# python
Python 3.7.7 (default, Mar 10 2020, 17:25:08)
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import jakecipher
>>> exit()
(py37) root@cf33c4cfb1e4:~#

```

