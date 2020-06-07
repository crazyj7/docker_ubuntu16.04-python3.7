#!/bin/bash

ENVNAME=/root/py37
if [ "$(ls -A $ENVNAME)" ]; then
#	echo Env $ENVNAME exists. skip init.
	source $ENVNAME/bin/activate
else
	echo Env $ENVNAME not exists. init env.
	python3.7 -m venv $ENVNAME
	source $ENVNAME/bin/activate
	pip install --upgrade pip
	pip install -r requirements.txt
fi

/bin/bash
