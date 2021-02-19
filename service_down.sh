#!/bin/bash

docker-compose -f ${PWD}/docker-compose.yml down --remove-orphans
#docker-compose -f ${PWD}/docker-compose.yml down