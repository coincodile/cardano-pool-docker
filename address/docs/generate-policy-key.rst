How to generate a private policy key, a public policy key and its hash
===============================================================================

One of the most common commands is to generate a policy key and its hash code.
In this secsion, I show you how to generate policy key from both root and account
key.

Generate from root key
-------------------------------------------------------------------------------

First of all, use the root key to generate a policy key.

.. literalinclude:: examples/generate-policy-key-1.sh
   :language: bash
   :caption: Generates policy key from the root private key
   :name: addresses/generate-policy-key.rst#code1

For child key
-------------------------------------------------------------------------------

You may create a policy key for an account key as follow.

.. literalinclude:: examples/generate-policy-key-2.sh
   :language: bash
   :caption: Generates policy key from an account key with chain code
   :name: addresses/generate-policy-key.rst#code2

Or create the same but without chain code.

.. literalinclude:: examples/generate-policy-key-3.sh
   :language: bash
   :caption: Generates policy key from an account key without chain code
   :name: addresses/generate-policy-key.rst#code3

Generate Policy Hash
-------------------------------------------------------------------------------
$ cardano-address key hash < policy.xvk
policy_vkh1qpc9xly4lc7yt98gcf59kdcqcss6dda4u9g72e775yxpxeypamc

$ cardano-address key hash < policy.vk
policy_vkh1qpc9xly4lc7yt98gcf59kdcqcss6dda4u9g72e775yxpxeypamc

$ cardano-address key hash --hex < policy.vk
0070537c95fe3c4594e8c2685b3700c421a6b7b5e151e567dea10c13



