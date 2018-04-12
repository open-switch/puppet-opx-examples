class lldp::lldp {

    file { 'lldpd.conf':
      path => '/etc/lldpd.conf',
      ensure => file,
      source => 'puppet:///modules/lldp/lldpd.conf',
      notify => Service['lldpd']
    }

    service { 'lldpd':
    ensure  => 'running',
    restart => '/etc/init.d/lldpd restart'
    }
}

