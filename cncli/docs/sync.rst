Sync Command
===============================================================================

This command connects to a remote node and synchronizes blocks to a local sqlite 
database. The validate and leaderlog commands require a synchronized database.

.. code-block:: bash

  $ docker run --interactive \
     --volume $PWD/cncli-db:/cncli-db \
     coincodile/cardano-cncli:latest \
     sync \
         --no-service  \
         --host relays.stakepool.at \
         --port 3001 \
         --db /cncli-db/root.db 
