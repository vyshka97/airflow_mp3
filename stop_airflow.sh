#!/bin/bash

docker-compose down

CURRENT_DIR=$( realpath $( dirname ${BASH_SOURCE[0]} ) )

rm -rf ${CURRENT_DIR}/logs ${CURRENT_DIR}/plugins ${CURRENT_DIR}/.env
