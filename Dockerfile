FROM ubuntu:latest

#Update apt-get to get things into ubuntu

#Uses \ to run multiple commands under one Run command
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

RUN apt-get update && apt-get install -y build-essential libyaml-dev python3-dev && rm -rf /var/lib/apt/lists/*

RUN pip3 install PyYAML==6.0.1

#COPY Files from repo to docker image
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

#The file to run at the start of workflow
ENTRYPOINT ["/entrypoint.sh"]