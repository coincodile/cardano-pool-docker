Monitoring
==========

If you want to monitor your nodes using prometheus across different hosts, you 
can set the environment variable `PROMETHEUS_HOST=0.0.0.0`. This makes the 
Prometheus service accessible to other hosts. So you can for example run a 
Prometheus+Grafana service on your relay node, scraping data from the 
block-producing and relay nodes.

If you do this, it is EXTREMELY important that you set up a Firewall rule ONLY 
allowing traffic from your relay nodes host on the Prometheus port, otherwise 
everyone will be able to monitor your node.


See
https://docs.cardano.org/projects/cardano-node/en/latest/logging-monitoring/prometheus.html
https://docs.cardano.org/projects/cardano-node/en/latest/logging-monitoring/grafana.html

| 12798 | Default port for Prometheus monitoring. |


.. toctree::
   :maxdepth: 2
   :caption: Contents:
   