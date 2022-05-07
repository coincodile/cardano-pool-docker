Leaderlog Command
===============================================================================


This command calculates a stakepool's expected slot list. "prev" and "current" 
logs are available as long as you have a sync'd database. "next" logs are only 
available 1.5 days before the end of the epoch.

This command requires that you:

* use cardano-cli to dump a fresh ledger-state.json file. 
* Use the sync command above to build a 100% sync'd cncli.db database file.

This is optional if you're using the API instead of a ledger-state json file.


Calculate leaderlog
-------------------------------------------------------------------------------

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     leaderlog \
         --pool-id 00beef284975ef87856c1343f6bf50172253177fdebc756524d43fc1 \
         --pool-vrf-skey ./bcsh2.vrf.skey \
         --byron-genesis ~/haskell/local/byron-genesis.json \
         --shelley-genesis ~/haskell/local/shelley-genesis.json \
         --ledger-state /tmp/ledger-state-227.json --ledger-set current


Calculate leaderlog failure
-------------------------------------------------------------------------------

Calculate leaderlog failure (too soon for "next" logs, or un-sync'd database)

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     leaderlog \
         --pool-id 00beef284975ef87856c1343f6bf50172253177fdebc756524d43fc1 \
         --pool-vrf-skey ./bcsh2.vrf.skey \
         --byron-genesis ~/haskell/local/byron-genesis.json \
         --shelley-genesis ~/haskell/local/shelley-genesis.json \
         --ledger-state /tmp/ledger-state-227.json \
         --ledger-set next



