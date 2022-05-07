#!/bin/bash
docker run --interactive \
    coincodile/cardano-address:latest \
    key from-recovery-phrase Shelley <  phrase.prv > root.xsk
