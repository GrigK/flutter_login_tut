#!/bin/bash

# http://127.0.0.1:8099/Databus-Servlet/databus
#mkdir -p ./logs
#touch ./logs/this.log

docker-compose -f ${PWD}/docker-compose.yml pull
#
#docker-compose -f ${PWD}/docker-compose.yml up -d dev
#docker-compose -f ${PWD}/docker-compose.yml up -d --build
docker-compose -f ${PWD}/docker-compose.yml up --build