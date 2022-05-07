Test setup
==========

These examples are ONLY for demonstration. 

The examples will run required nodes on the same server, using the `host` network, 
and connects to each other using the localhost IP-address. 
This is not recommended. 
It is recommended to run the nodes on seperate servers and connect them using 
their public or local network IP-addresses, if they run within the same network. 
The idea is to keep the block-producing node completely locked off from anything 
other than the relay node. 
The block-producing node will also initialize and register 
the stake pool automatically, which is better to do on a seperate node, to keep 
the `cold-keys` directory and `wallets` secret key files (`wallets/*/*.skey`)
completely away from the online nodes.

In the most of the cases, this configuration is used, but with seperated hosts.

Follow subsections to launch the test setup.

Create a Metadata 
---------------------------------------------------------------------------

Upload your stake-pool metadata JSON file to a host so it is accessible to 
the public. 
A common way is to place in public Git repositories such as 
`github <https://gist.github.com/>`_.

The metadata JSON file contains definistion of the stake pool. Here is a very
simple metadata JSON file.

.. literalinclude:: examples/metadata.json
   :language: json
   :caption: A small metadata JSON file
   :name: examples/metadata.json

Launch a Relay Node
---------------------------------------------------------------------------

Start a relay node and make it connect to the block-producing node. 

You may run this with a simple command. The following command executes a relay
node:

.. literalinclude:: examples/mc4-relay1.sh
   :language: bash
   :caption: Run relay node locally on mainnet-candidate4.
   :name: examples/mc4-relay1.sh

Launch a Block Producer
---------------------------------------------------------------------------

Start a block-producing node with the `--start`, `--staking` and `--create` 
arguments, and make it connect to the relay node. 

See the `examples/mc4-producing.sh` example file.

.. literalinclude:: examples/mc4-producing.sh
   :language: bash
   :caption:  Run block-producing node locally on mainnet-candidate4 and initialize and register the it as a stakepool.
   :name: examples/mc4-producing.sh


Wait for the block-producing node to setup and register your pool.

Fund your payment address generated and displayed in Step 4 to finalize the 
registration.

Integrated Test with DockerCompose
---------------------------------------------------------------------------

The following docker-compose file will run these 2 containers 
automatically.

.. literalinclude:: examples/mc4-docker-compose.yaml
   :language: yaml
   :caption: docker compose file for running relay node and block-producing node locally on mainnet-candidate4, and initialize and register the stakepool 
   :name: examples/mc4-docker-compose.yaml

Use the command `docker-compose up` to start them.

