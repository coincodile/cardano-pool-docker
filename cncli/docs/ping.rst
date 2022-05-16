Ping Command
===============================================================================

This command validates that the remote server is on the given network and returns 
its response time.

.. code-block:: bash

  $ docker run --interactive \
     coincodile/cardano-cncli:latest \
     ping \
         --host relays.stakepool.at \
         --port 3001
