# Sample BGP module for OpenSwitch OPX

The sample BGP module facilitates the configuration of BGP quagga. It requires the Puppet setup (server-agent) to be done.

## Dependencies

The sample BGP bgp_quagga.pp manifest inside the module is built on resources included in core Puppet code.

## Sample BGP Configuration

The sample BGP manifest for quagga first installs quagga, copies all configurations to target device and restarts the quagga service.

Apart from the manifest, two configuration files must be present in the ``/files/`` folder in the module.
- daemons
- bgpd.conf


## References

- https://puppet.com/docs/puppet/5.3/types/package.html
- https://puppet.com/docs/puppet/5.3/types/file.html
- https://puppet.com/docs/puppet/5.3/types/exec.html
- https://puppet.com/docs/puppet/5.3/types/service.html


(c) 2018 Dell Inc. or its subsidiaries. All Rights Reserved.
