Best practice
=============

This is an example on how to run your staking pool in a completely secure way, 
by only keeping your `cold-keys` and `wallets` on a completely offline node, and 
then transfer all relevant registration transactions and `pool-keys` to the 
online block-producing node. This requires a bit more steps than the reasonably 
secure method.

For this setup you will need 3 hosts.

* `host1` for running the relay node.
* `host2` host for running the block-producing node and submitting the registration transactions.
* `host3` host for generating all the keys, addresses, certificates and transactions, and storing the cold-keys for refreshing the KES keys and certificates. This must be an completely offline host running locally.

.. raw:: html
    :file: ./graphs/best-practice-deploy.svg
    
1. Upload your stake-pool metadata json file ([See example](#metadata-example)) to a host so it is accessible to the public. For example as a [github gist](https://gist.github.com/).
2. Start a relay node on `host1` and make it connect to the block-producing node on `host2`.
3. Generate `protocol.json` on `host1` by running `get_protocol`.
4. Transfer the `protocol.json` from `host1` to the staking directory of `host3`.
5. Add the `metadata.json` file to `config/staking` directory the on `host3`
6. Start a cold-creation node `host3` using the `--create-cold` argument, and follow steps.
7. Fund your owners payment address(es) created on `host3`, make sure you send to the correct addresses.
8. Get UTXO and TXIX for funded owners payment address(es) by quering the address(es) on `host1` or `host2`.
9. Input the relevant UTXO and TXIX values when promted on `host3`.
10. Find the slot tip of the blockchain by running `get_slot` on `host1` or `host2`.
11. Input the slot tip on `host3` when prompted.
12. Create Firewall rules for your block-producing node on `host2` to only accept incoming traffic from your relay node on `host1`.
13. Upload staking-hot.tar.gz on `host2`
14. Start a block-producing node on `host2`, with the `--start`, `--staking` and `--register-cold` arguments, and make it connect to the relay node on `host1`.
15. Wait for the block-producing node on `host2` to register your pool and start staking.

See examples of the containers in `examples/best-practice/`.
