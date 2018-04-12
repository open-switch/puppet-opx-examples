class clos_fabric( $node_data = hiera("quagga_data") ){

    package { 'quagga':
      ensure => present,
      provider => 'apt'
    }

    file { 'daemons':
      path => '/etc/quagga/daemons',
      ensure => file,
      source => 'puppet:///modules/clos_fabric/daemons',
    }

   file { 'quagga.conf':
      path => '/etc/quagga/Quagga.conf',
      ensure => file,
      content => $node_data,
      notify => Service['quagga'],
    }
   
   service { 'quagga':
    ensure  => 'running',
    restart => 'service quagga restart',
    }

    exec { 'show_running_configuration':
    subscribe => File['quagga.conf'],
    refreshonly => true,
    require => Service['quagga'],
    command => '/usr/bin/vtysh -c "show running-config"',
    # Replace with different bgp show commands
    logoutput => true
    }
}

