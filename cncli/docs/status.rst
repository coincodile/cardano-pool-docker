Status Command
===============================================================================

This simple command gives you an ok if the database is fully synced. It will 
return a status of error if not.


Status when fully synced

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     status \
         --byron-genesis ~/haskell/local/byron-genesis.json \
         --shelley-genesis ~/haskell/local/shelley-genesis.json

Status when not fully synced

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     status \
         --byron-genesis ~/haskell/local/byron-genesis.json \
         --shelley-genesis ~/haskell/local/shelley-genesis.json \
         --db dummy.db
