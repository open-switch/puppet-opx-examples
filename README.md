# Sample Puppet modules for OpenSwitch OPX

Puppet is an model-driven, open-source configuration mangement tool, and is a powerful tool which helps in the concept of infrastructure as code. It is written in the Ruby DSL language that helps in converting a complete infrastructure in code format that can be easily managed and configured.

Puppet follows client-server architecture:

- The client known as *agents* are the systems that need to be configured. Puppet agents communicate with the server and fetch configuration instructions, then applies the configuration on the system and sends the status report to the server.
- The server is known as the *master* that can be used as a stand-alone application. Puppet has the capability to manage any system from scratch, starting from the initial configuration until the end-of-life of any particular machine.

Reference for puppet official documentation:

- https://puppet.com/docs/puppet/5.4/index.html

The modules in the directory contain sample manifests that facilitate the configuration of various features like LLDP, interface, route, BGP (quagga) and port mirroring.

## Dependencies

The setup uses Puppet 5.3.3 on server and Puppet 5.3.4 on agent (OpenSwitch OPX). The sample manifests for the modules uses the puppet resources in https://puppet.com/docs/puppet/5.3/type.html.

## Puppet server and agent setup

See these links for Puppet server and agent installation:

- https://puppet.com/docs/puppetserver/5.1/install_from_packages.html
- https://puppet.com/docs/puppet/5.3/install_linux.html
 
## Puppet modules overview, setup, and execution

Modules are self-contained bundles of code and data with a specific directory structure. They are written and maintained in server. Modules must have a valid name and be located in ``modulepath``. An example path in a development environment is ``/opt/puppetlabs/puppet/modules/<mod_name>``. 

Reference: https://puppet.com/docs/puppet/5.3/modules_fundamentals.html

The ``opx`` module is a high-level module that has an ``init.pp`` puppet manifest file where one could include the necessary modules to be applied to the agent. Each feature-specific module contain manifests which is a ``<feature.pp>`` puppet file that has the class definition - this name must match the module name. The dependent configuration files are placed in the ``files`` directory. The code uses the file path structure (such as ``puppet:///modules/lldp/lldpd.conf``) which indicates the ``/opt/puppetlabs/puppet/modules/lldp/files/lldpd.conf`` path.

The ``site.pp`` file is in the manifest path of the server. An example path in development environment is ``/etc/puppetlabs/code/environments/production/manifests`` which includes the opx module that has specific features which need to be pushed to the list of agent nodes. 

To start the Puppet server:

    puppet master --verbose --no-daemonize

To run the agents:

    puppet agent -t


(c) 2018 Dell Inc. or its subsidiaries. All Rights Reserved.
