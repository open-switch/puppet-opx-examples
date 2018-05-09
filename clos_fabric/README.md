# Provision CLOS fabric with Puppet using Quagga example

The sample module using hiera of puppet facilitates the configuration of routing in OpenSwitch OPX using quagga.  It requires the Puppet setup (server-agent) to be done.

The sample topology is a two-tier CLOS fabric with two spines and two leafs connected as mesh. EBGP is running between the two tiers. All switches in spine have the same AS number, and each leaf switch has a unique AS number. All AS number used areprivate. Below is the example for configuring BGP and interace using Quagga.

## Routing using Quagga

*Note: Reference - Routing using Quagga section in OPX Configuration Guide Release 2.1.0*

![Alt text](./../_static/quagga-routing.png?raw=true "Title")

## Dependencies

The sample clos fabric module uses the hiera support of puppet and other built in resources of core puppet. Puppet version should be higher than 2.7 for the hiera support. 

## Sample module - CLOS fabric configuration

The clos fabric implementation of puppet uses the hiera(V.5) framework utility of puppet to push the configuration to multiple nodes dynamically.

The sample module installs quagga and copies node specific quagga configurations. The configuration file for each quagga deamons is present inside hieradara folder as yaml files with the node name as the file name.

Settings and file paths for hiera:

- The clos fabric is placed inside the modules folder of puppet. /opt/puppetlabs/puppet/modules.

- Add hiera_config path to "/etc/puppetlabs/puppet/puppet.conf"
  hiera_config=/etc/puppetlabs/puppet/hiera.yaml

- Copy the hieradata folder and hiera.yaml to "/etc/puppetlabs/puppet"

The hiera.yaml files inside puppet contains the type of backend file which is yaml here and the hierarchy will fetch the data file destined for the node based on the node hostname at runtime.

Quagga configurations for all leaf-spines must be present in the hieradata folder in puppet  - ``leaf1.yaml``, ``leaf2.yaml``, ``spine1.yaml``, and ``spine2.yaml``. The node specific configuration file (for example ``leaf1.yaml``) will be copied as ``/etc/quagga/Quagga.conf`` in the target node (leaf1).

The yaml file will have data with name quagga_data, which is used as a variable in the manifest init.pp to search the hiera and fetch the data.

The manifest init.pp in the clos_fabric module class have the sample parameter for quagga data. To add multiple configuration files and push the data to specific nodes additional class parameter can be added and the files push for the other configurations can be done using the file and service resources. Sample clos_fabric init.pp with lldp configuration for different nodes. 

    class clos_fabric( $node_lldp_data = hiera("lldp_data") ){
      file { 'lldpd.conf':
      path => '/etc/lldpd.conf',
      ensure => file,
      content => $node_lldp_data,
      notify => Service['lldpd']
      }

      service { 'lldpd':
      ensure  => 'running',
      restart => '/etc/init.d/lldpd restart'
      }
    }

The respective configuration files also should be added in the hieradata folder. The sample hiera.yaml for the multiple conf files for the node:

    ---
    version: 5
    defaults:
      datadir: "/etc/puppetlabs/puppet/hieradata"
      data_hash: yaml_data
    :hierarchy:
      - name: "bgp data per node"
        path: "%{trusted.certname}_bgp.yaml"
      - name: "lldp data per node"
        path: "%{trusted.certname}_lldp.yaml"

Sample leaf1_lldp.yaml in hieradata:

        lldp_data: |
            configure lldp tx-hold 6
            configure med fast-start tx-interval 7
            configure med fast-start enable
            configure lldp tx-interval 80
            unconfigure system interface promiscuous
            configure system bond-slave-src-mac-type local

To apply quagga configurations to the nodes, in the manifest site.pp file include the clos_fabric class for the respective nodes

    Sample site.pp 

    node leaf1 {
      include clos_fabric
    }
    node leaf2 {
      include clos_fabric
    }
    node spine1 {
      include clos_fabric
    }
    include spine2 {
      include clos_fabric
    }

Start the puppet agent on nodes to pull in their specific configurations

## References

https://puppet.com/docs/puppet/5.3/types/package.html

https://puppet.com/docs/puppet/5.3/types/file.html

https://puppet.com/docs/puppet/5.3/types/exec.html

https://puppet.com/docs/puppet/5.3/types/service.html

https://puppet.com/docs/hiera/3.3/hierarchy.html


(c) 2018 Dell Inc. or its subsidiaries. All Rights Reserved.
