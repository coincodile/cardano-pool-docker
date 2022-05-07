Sync Command
===============================================================================

This command connects to a remote node and synchronizes blocks to a local sqlite 
database. The validate and leaderlog commands require a synchronized database.

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     sync \
         --host north-america.relays-new.cardano-mainnet.iohk.io \
         --port 3000 \
         --db ./cncli-db \
         --network-magic 1097911063

