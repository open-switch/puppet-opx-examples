# Sample LLDP module for OpenSwitch OPX

The sample LLDP module facilitates the configuration of link layer discovery protocol (LLDP) using ``lldpcli``. It requires the Puppet setup (server-agent) to be done.

## Dependencies

The sample lldp.pp manifest inside the module is built on resources included in the core Puppet code.

## Sample LLDP configuration

The sample LLDP recipe uses the file push mechanism where a ``lldpd.conf`` file containing all the ``lldpcli`` commands is first pushed to ``/etc`` in the target device, and the ``lldpd`` service is restarted for the change to take effect. 

The module contains the lldp conf file in addition to the lldp.pp manifest - ``files/lldpd.conf``.

## References

- https://puppet.com/docs/puppet/5.3/types/file.html
- https://puppet.com/docs/puppet/5.3/types/service.html


(c) 2018 Dell Inc. or its subsidiaries. All Rights Reserved.
