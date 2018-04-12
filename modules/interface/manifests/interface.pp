class interface::interface {

    exec { 'enable_interface':
      command => '/sbin/ip link set dev e101-007-0 up',
      logoutput => true
    }

    exec { 'disable_interface':
      command => '/sbin/ip link set dev e101-007-0 down',
      logoutput => true
    }

    exec { 'add_ipv4_interface':
      command => '/sbin/ip addr add 10.2.2.2/24 dev e101-011-0',
      logoutput => true
    }

    exec { 'add_ipv6_interface':
      command => '/sbin/ip -6 addr add 3000::1/64 dev e101-010-0',
      logoutput => true
    }

    exec { 'delete_ip_interface':
      command => '/sbin/ip addr del 10.2.2.2/24 dev e101-011-0',
      logoutput => true
    }

    exec { 'set_show_interface_properties':
      command => '/sbin/ip link set dev e101-012-0 mtu 1400 && /sbin/ip addr show e101-012-0',
      logoutput => true
    }
}

