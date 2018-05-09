# Sample module for OpenSwitch OPX

The sample OpenSwitch OPX module facilitates the configuration of features such as LLDP, BGP, interface, route, and port mirroring. It requires the Puppet setup (server-agent) to be done and start the Puppet server and agent.

## Dependencies

The sample ``init.pp`` manifest inside the module facilitates the use of a single OPX module in ``site.pp`` that applies the specified features included in the manifest.

## Sample OPX configuration

The sample OPX manifest includes the features lldp, bgp_quagga, interface, route, and port_mirroring to apply on the node. The manifest ``site.pp`` includes the OPX module for the OpenSwitch device.

## Execute OPX module

 - To start the puppet server execute ``puppet master --verbose --no-daemonize``

 - To run the agents execute ``puppet agent -t``


(c) 2018 Dell Inc. or its subsidiaries. All Rights Reserved.
