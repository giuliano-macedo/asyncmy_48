FROM python:3.9.15-slim-buster

RUN pip install -U pip==22.3.1


RUN apt-get update \
    && apt-get install gcc -y libc-dev build-essential git \
    && apt-get clean

RUN pip install asyncmy==0.2.5

RUN python --version
RUN pip --version
RUN pip list | grep setuptools
RUN python -c 'import asyncmy'
