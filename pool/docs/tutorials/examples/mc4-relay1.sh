#!/bin/bash
docker network create -d bridge cardano
docker run -it \
    --restart=unless-stopped \
    --network=cardano \
    --name mc4-relay1 \
    -p 3000:3000 \
    -p 12798:12798 \
    -e HOST_ADDR="0.0.0.0" \
    -e NODE_PORT="3000" \
    -e NODE_NAME="relay1" \
    -e NODE_TOPOLOGY="127.0.0.1:3000/1" \
    -e NODE_RELAY="True" \
    -e CARDANO_NETWORK="test" \
    -e PROMETHEUS_PORT="12798" \
    -v $PWD/config/:/config/ \
    coincodile/cardano-pool:latest --start