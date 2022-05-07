How to generate a root private key
===============================================================================

A root private key is the main feature required in cardano. A root 
private key is stored in .xsk file. To generate a root private key
you have to prepaire a recovery phrases at first. Then use the following
command to create a new key:

.. literalinclude:: examples/generate-root-private-key.sh
   :language: bash
   :caption: Generates a root private key
   :name: addresses/generate-root-private-key.rst#code1

Notice the root_xsk prefix to identify a root extended signing (private) key.