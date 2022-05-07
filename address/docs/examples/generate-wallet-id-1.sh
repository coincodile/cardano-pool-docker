#!/bin/bash
docker run --interactive \
    coincodile/cardano-address:latest \
    key walletid < root.xsk
