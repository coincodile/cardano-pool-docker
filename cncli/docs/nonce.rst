Nonce Command
===============================================================================

This command calculates the epoch nonce value.

This command requires that you:

Use the sync command above to build a 100% sync'd cncli.db database file.

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     nonce \
         --byron-genesis ~/haskell/test/byron-genesis.json \
         --shelley-genesis ~/haskell/test/shelley-genesis.json \
         --ledger-set next

