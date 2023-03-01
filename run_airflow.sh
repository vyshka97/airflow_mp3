#!/bin/bash

CURRENT_DIR=$( realpath $( dirname ${BASH_SOURCE[0]} ) )

mkdir -p ${CURRENT_DIR}/logs ${CURRENT_DIR}/plugins
echo -e "AIRFLOW_UID=$(id -u)" > .env

# Initialize the database
docker-compose up airflow-init

# Start up all services
docker-compose up
