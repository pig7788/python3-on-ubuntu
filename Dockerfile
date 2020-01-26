FROM ubuntu:18.04
  
RUN apt-get update && apt-get install vim locales zip unzip \
    fontconfig default-libmysqlclient-dev libssl-dev -y

RUN locale-gen zh_TW.UTF-8

ENV LANG zh_TW.UTF-8

ENV LANGUAGE zh_TW.UTF-8

ENV LC_ALL zh_TW.UTF-8

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
