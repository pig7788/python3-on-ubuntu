# python3-on-ubuntu
This is easy and flexible to use. When you want to build a service without many images, shell scripts might be more flexible.
## Getting Started
### Scenario: In order to build a jupyterlab online service for internal users
#### 1. Create a shell script file:jupyterlab-start.sh
```shell
#!/bin/bash 
isExisted=$(pip3 list | grep jupyterlab | awk '{print $1}') # prevent a bug when build an initial container without target service

if [[ -z "$isExisted" ]]; then
pip3 install jupyterlab # you can add more libs you want or directly import multiple libs in a txt file
fi

jupyter-lab # execute service
```
#### 2. Run as service (here is using docker-compose)
```shell
services:
  jupyterlab:
    image: pig7788/python3-on-ubuntu:latest
    container_name: jupyterlab
    ...
    ...
    ...
    ...
    entrypoint:
      - <path in container>/jupyterlab-start.sh # execute shell script file in container
```
## Change log
* `1.0.2` - add ubuntu packages for installing mysqlclient in python3
* `1.0.1` - fix some bugs
* `1.0` - init
