#!/bin/bash
docker run --interactive \
    coincodile/cardano-address:latest \
    key child 1855H/1815H/0H < root.xsk > policy.xsk

