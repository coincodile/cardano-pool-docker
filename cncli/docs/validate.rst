Validate Command
===============================================================================

This command validates that a block hash or partial block hash is on-chain. You 
must run sync command separately to build up the database and have it sync to 100%.


Validate block success

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     validate --hash 0c4b73


Validate block orphaned

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     validate --hash af6d8e


Validate block missing

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     validate --hash ffffff