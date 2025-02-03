FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  apt install python3.10 \
  apt install python3-pip \
  apt install git

RUN apt install pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
