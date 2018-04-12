class port_mirroring::port_mirroring {

    exec { 'create_mirror':
    environment => [ "PYTHONPATH=/usr/lib/opx:/usr/lib/x86_64-linux-gnu/opx", "LD_LIBRARY_PATH=/usr/lib/opx:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib:/lib"],
    command => '/usr/bin/cps_config_mirror.py create span e101-001-0 e101-002-0 tx',
    logoutput => true
    }

    exec { 'delete_mirror':
    environment => [ "PYTHONPATH=/usr/lib/opx:/usr/lib/x86_64-linux-gnu/opx", "LD_LIBRARY_PATH=/usr/lib/opx:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib:/lib"],
    command => '/usr/bin/cps_config_mirror.py delete 4',
    logoutput => true
    }

    exec { 'get_mirror':
    environment => [ "PYTHONPATH=/usr/lib/opx:/usr/lib/x86_64-linux-gnu/opx", "LD_LIBRARY_PATH=/usr/lib/opx:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib:/lib"],
    command => '/usr/bin/cps_config_mirror.py get 5',
    logoutput => true
    }
}

