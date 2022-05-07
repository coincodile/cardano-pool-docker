How to generate a wallet id based on extended root or account keys
===============================================================================

The easiest way to create a wallet id is to use the root private key. Here is an
example:

.. literalinclude:: examples/generate-wallet-id-1.sh
   :language: bash
   :caption: Generates a wallet id by root key
   :name: addresses/generate-wallet-id.rst#code1

An other way, is to use the related public key. In the following example, a public
key taken from private and then a wallet id is generated from.

.. literalinclude:: examples/generate-wallet-id-2.sh
   :language: bash
   :caption: Generates a wallet id by root key
   :name: addresses/generate-wallet-id.rst#code2

In some cases, you may create a child account key, and then use it as wallet, for 
security resone. Following example create an account key, then extract wallet id from.

.. literalinclude:: examples/generate-wallet-id-3.sh
   :language: bash
   :caption: To generate an account private key and wallet id
   :name: addresses/generate-wallet-id.rst#code3


