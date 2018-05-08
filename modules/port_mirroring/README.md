# Sample port mirroring module for OpenSwitch OPX

The sample module facilitates the configuration of port mirroring. It requires the Puppet setup (server-agent) to be done.

## Dependencies

The sample port_mirroring.pp manifest inside the module is built on resources included in core Puppet code.

## Sample port mirroring configuration

The sample port mirroring manifest uses the puppet built-in resource to execute the OPX provided Python script to configure port mirroring using CPS.

The CPS-provided Python script ``cps_config_mirror.py`` facilitates following options for port mirroring:

 - ``cps_config_mirror.py create [type] [dst_intf] [source_intf] [dir]``
 
 - ``cps_config_mirror.py get [mirror_id]``

 - ``cps_config_mirror.py delete [mirror_id]``

 - ``cps_config_mirror.py set_source [mirror_id] [source_intf] [dir]``

 - ``cps_config_mirror.py set_dest [mirror_id] [dst_intf]``


## Reference

https://puppet.com/docs/puppet/5.3/types/exec.html


(c) 2018 Dell Inc. or its subsidiaries. All Rights Reserved.
