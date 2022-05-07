#!/bin/bash
docker run --interactive \
    coincodile/cardano-address:latest \
    key hash --hex < policy.vk
