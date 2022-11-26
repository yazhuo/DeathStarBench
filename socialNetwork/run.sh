#!/bin/bash

servers=(
"yazhuoz@hp004.utah.cloudlab.us"
"yazhuoz@c220g5-111223.wisc.cloudlab.us"
)

# Update source code for each server
for i in ${servers[@]}; do
    (ssh -p 22 $i "cd /proj/latencymodel-PG0/yazhuoz/DeathStarBench/ && git pull origin yazhuo_dev")&
done
wait

stackname=$1

# Deploy DSB from master node
docker stack deploy -c docker-compose-swarm-$stackname.yml $stackname
