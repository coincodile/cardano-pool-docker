Sendslots command
===============================================================================

The sendslots command securely sends pooltool the number of slots you have 
assigned for an epoch and validates the correctness of your past epochs. You 
must have a sync'd database and have calculated leaderlogs for every pool in 
pooltool.json before calling this command. It should be called within the first 
10 minutes of the epoch cutover.


Sendslots success
-------------------------------------------------------------------------------

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     sendslots \
         --byron-genesis ~/haskell/local/byron-genesis.json \
         --shelley-genesis ~/haskell/local/shelley-genesis.json
 
 
systemd scripts
-------------------------------------------------------------------------------

sync and sendtip can be easily enabled as systemd services. Here are some example 
configurations.


.. literalinclude:: assets/cncli-sync.service
   :language: bash
   :caption: Systemd config
   :name: cncli:assets/cncli-sync.service


.. literalinclude:: assets/cncli-sendtip.service
   :language: bash
   :caption: Systemd config
   :name: cncli:assets/cncli-sendtip.service
 


