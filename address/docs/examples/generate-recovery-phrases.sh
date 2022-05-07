#!/bin/bash
docker run -it \
    coincodile/cardano-address:latest \
    recovery-phrase generate --size 15 > phrase.prv
