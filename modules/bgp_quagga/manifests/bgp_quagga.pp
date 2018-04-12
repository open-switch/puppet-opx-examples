class bgp_quagga::bgp_quagga {

    package { 'quagga':
      ensure => present,
      provider => 'apt'
    }

    file { 'daemons':
      path => '/etc/quagga/daemons',
      ensure => file,
      source => 'puppet:///modules/bgp_quagga/daemons',
    }

    service { 'quagga':
    ensure  => 'running',
    restart => 'service quagga restart'
    }

    file { 'bgpd':
      path => '/etc/quagga/bgpd.conf',
      ensure => file,
      source => 'puppet:///modules/bgp_quagga/bgpd.conf',
      notify => Service['quagga']
    }

    exec { 'show_bgp_neighbor':
    subscribe => File['bgpd'],
    refreshonly => true,
    require => Service['quagga'],
    command => '/usr/bin/vtysh -c "show bgp neighbors"',
    # Replace with different bgp show commands
    logoutput => true
    }
}
