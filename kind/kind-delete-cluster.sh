#!/bin/sh
set -o errexit

reg_name='kind-registry'

kind delete cluster

registryAvailable=$(docker ps -a | grep $reg_name | wc -l)
if [ $registryAvailable -gt 0 ]; then
    docker stop $reg_name > /dev/null 2>&1
    docker rm $reg_name > /dev/null 2>&1
fi
