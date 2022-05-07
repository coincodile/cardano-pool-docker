NODE_TOPOLOGY
=============

Nodes (both block-producing and relay nodes), are configured with NODE_TOPOLOGY variable, 
which defines the network nodes with which your node can communicate.

The variable must specify at least three parameters for each connection:

* addr: the IP address of the node that your node should talk to.
* port: the port that you wish that communication to go through.
* valency: defines how many open connections your node should have. 

The valency parameter only affects DNS addresses. If a DNS address is provided, valency 
determines the number of resolved IP addresses that the node should maintain an active 
connection with. For IP addresses, valency is a boolean value where 0 means that the 
address should be ignored.

Each node must define as the following pattern

.. code-block:: yaml

	NODE_TOPOLOGY: <address>:<port>/<valency>
	
So for example: 

.. code-block:: yaml

	NODE_TOPOLOGY: 127.0.0.1:3001/1

If there are more than one node, use a comma seperated list. For example, here is a list of
two node:

.. code-block:: yaml

	NODE_TOPOLOGY: 127.0.0.1:3001/1, node.com:3001/2

