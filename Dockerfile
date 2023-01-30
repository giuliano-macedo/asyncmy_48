FROM python:3.9.15-slim-buster
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/app/src/
ENV PATH="/root/venv/bin:$PATH"
WORKDIR /app

RUN pip install -U pip==22.3.1 pipenv==2022.6.7;
RUN python -m venv /root/venv

RUN apt-get update \
    && apt-get install gcc -y libc-dev build-essential git \
    && apt-get clean

COPY ./Pipfile.lock ./Pipfile /app/

RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy -vvv
ENV PATH ".venv/bin:$PATH"

RUN pipenv run python --version
RUN pipenv run pip --version
RUN pipenv run pipenv --version
RUN pipenv run pip list | grep setuptools
RUN pipenv run python -c 'import asyncmy'
