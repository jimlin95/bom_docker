#!/bin/bash
#run docker
docker run --name bom -v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD:/src -d -p 2222:22 jimlin95/python27_env:v1.01
