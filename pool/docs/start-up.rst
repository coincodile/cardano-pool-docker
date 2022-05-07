Start up Script
===============

You can pass the following arguments to the start up script.


Start Node
---------

Start node.

--start

Create stake pool
----------------

Start stake pool creation. 

Initializes Stake Pool keys, addresses and certificates, and sends them to the
blockchain, when starting as a stake pool, if it is not already initialized.

| --create | 

Create COLD
------------

--cold-create

Initializes Stake Pool keys, addresses and certificates, and 
sign registration transactions. Registration transactions has to be sent using 
the `--cold-register` argument.

Register Cold
--------------

| --cold-register | 

Submits the address and pool registration transactions to the blockchain created 
using the `--cold-create` argument.

Start as Staking Node
---------------------

| --staking | Start as a staking node (Requires the `--start` argument) |

Start command line interface
----------------------------

| --cli | Start command-line interface. |

Initializing 
----------------
| --init_config | Initialize config. |

Help
--------

see this message.

| --help |  |

