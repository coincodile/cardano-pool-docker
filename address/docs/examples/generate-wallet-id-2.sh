#!/bin/bash
docker run --interactive \
    coincodile/cardano-address:latest \
    key public --with-chain-code < root.xsk | \
docker run --interactive \
    coincodile/cardano-address:latest \
    key walletid
