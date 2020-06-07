# Ubuntu 16.04 + python 3.7

+ Docker build
```
docker build -t crazyj7/ubuntu16.04-python3.7 .
```

+ Docker container launch
	+ Windows 
```
docker run -it -v /c/docker/python:/root/py37 crazyj7/ubuntu16.04-python3.7
```
	+ Linux
```
docker run -it -v /home/crazyj7/docker/python:/root/py37 crazyj7/ubuntu16.04-python3.7
```

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

