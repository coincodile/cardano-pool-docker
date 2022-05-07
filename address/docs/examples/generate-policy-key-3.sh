#!/bin/bash
docker run --interactive \
    coincodile/cardano-address:latest \
    key child 1855H/1815H/0H < root.xsk | \
docker run --interactive \
    coincodile/cardano-address:latest \
    key public --without-chain-code > policy.vk
