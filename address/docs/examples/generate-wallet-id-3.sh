#!/bin/bash
docker run --interactive \
    coincodile/cardano-address:latest \
    key child 1852H/1815H/0H < root.xsk > acct.xsk
docker run --interactive \
    coincodile/cardano-address:latest \
    key walletid < acct.xsk
