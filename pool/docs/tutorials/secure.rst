Reasonably secure
================

This is an example on how to run your staking pool in a reasonably securely way, 
by keeping your `cold-keys` and `wallets` away from the online block-producing 
node. It is always a trade-off between security and convenience, but I find this 
method to be reasonably secure, if you can some precautions, as described in 
the below setup.

For this setup you will need 3 hosts.
`host1` for running the relay node.
`host2` host for running the block-producing node.
`host3` host for generating and registering all the keys, addresses and certificates and storing the cold-keys for refreshing the KES keys and certificates. This can be a host you are running locally, for example a secure linux live boot, with all incoming traffic completely shut off. **Warning:** If you run on a Linux live boot, with no persistant storage, it is EXTREMELY important that you backup your staking directory containing all the private keys, before you shut it off, otherwise your wallets will be lost.

1. Upload your stake-pool metadata json file ([See example](#metadata-example)) to a host so it is accessible to the public. For example as a [github gist](https://gist.github.com/).
2. Start a relay node on `host1` and make it connect to the block-producing node on `host2`. See the [relay node example](#relay-example2).
3. Start a registration node on `host3`, with the `--staking` and`--create` arguments, and make it connect to the relay node on `host1`. See the [registration node example](#registration-example2).
4. Fund your payment address generated and displayed in Step 3 to finalize the registration.
5. Wait for the registration node on `host3` to setup and register your pool.
6. Create Firewall rules for your block-producing node on `host2` to only accept incoming traffic from your relay node on `host1`.
7. Copy the `config/staking/pool-keys` directory from the registration node on `host3` to the `config/staking/pool-keys` directory on `host2`.
8. Start a block-producing node on `host2`, with the `--start` and `--staking` arguments, and make it connect to the relay node on `host1`. See the [block-producing node example](#producing-example2).


Renewing KES keys and certificates
----------------------------------

To renew your KES keys and certificates you have to run the `generate_operational_certificate` command in the registration container on `host3`
The status window in the block-producing container will tell you when you have to generate new keys.

1. Start the command-line interface in the registration container, containing the `cold-keys` directory, on `host3`. Using `docker exec -it main-registration bash`.
2. Run the `generate_operational_certificate` command and wait for it to complete.
3. Copy the `config/staking/pool-keys/` directory on `host3` to the `config/staking/pool-keys/` directory on `host2`
4. Restart the block-producing container on `host2`.

Relay node on mainnet
--------------------

Step 1. Run on `host1`. See `examples/main-relay1.sh`.

.. code-block:: yaml

  docker network create -d bridge cardano
  docker run -it \
      --restart=unless-stopped \
      --network=cardano \
      --name main-relay1 \
      -e HOST_ADDR="0.0.0.0" \
      -p 3000:3000 \
      -p 12798:12798 \
      -e NODE_PORT="3000" \
      -e NODE_NAME="relay1" \
      -e NODE_TOPOLOGY="<IP-address of block-producing node>:3000/1" \
      -e NODE_RELAY="True" \
      -e CARDANO_NETWORK="main" \
      -e PROMETHEUS_PORT="12798" \
      -v $PWD/config/:/config/ \
      coincodile/cardano-node:latest --start


#### registration node on mainnet <a id="registration-example2"></a>

Step 2. Run on `host3`. See `examples/main-registration.sh`.

.. code-block:: yaml

  docker network create -d bridge cardano
  docker run -it --rm \
      --name main-registration \
      --network=cardano \
      -e HOST_ADDR="0.0.0.0" \
      -e NODE_PORT="3000" \
      -e NODE_NAME="registration" \
      -e NODE_TOPOLOGY="<IP-address of relay1 node>:3000/1" \
      -e CARDANO_NETWORK="main" \
      -e CREATE_STAKEPOOL="True" \
      -e POOL_PLEDGE="100000000000" \
      -e POOL_COST="340000000" \
      -e POOL_MARGIN="0.05" \
      -e METADATA_URL="<URL of metadata.json>" \
      -v $PWD/config/:/config/ \
      coincodile/cardano-node:latest --create --staking


#### block-producing node on mainnet <a id="producing-example2"></a>

Step 5. Run on `host2`. See `examples/main-producing.sh`.

.. code-block:: yaml

  docker network create -d bridge cardano
  docker run -it --rm \
      --network=cardano \
      --name main-producing \
      -p 3000:3000 \
      -p 12798:12798 \
      -e HOST_ADDR="0.0.0.0" \
      -e NODE_PORT="3000" \
      -e NODE_NAME="block-producing" \
      -e NODE_TOPOLOGY="<IP-address of relay1 node>:3000/1" \
      -e CARDANO_NETWORK="main" \
      -e PROMETHEUS_PORT="12798" \
      -v $PWD/config/:/config/ \
      coincodile/cardano-node:latest --start --staking
