class route::route {

    exec { 'configure_route':
      command => '/sbin/ip route add 16.1.1.0/24 via 10.0.0.2',
      logoutput => true
    }

   exec { 'delete_route':
     command => '/sbin/ip route delete 30.30.30.0/24',
     logoutput => true
    }

   exec { 'show_route':
     command => '/sbin/ip route show',
     logoutput => true
   }
}

