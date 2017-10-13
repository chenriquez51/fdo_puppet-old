## Class for managing user accounts on the fasterdevops/riley science network

class resources::users {

  user { 'kolby' :
    ensure     => present,
    uid        => '1002',
    shell      => '/bin/bash',
    home       => '/home/kolby',
    managehome => false,
  }

  user { 'riley' :
    ensure     => present,
    uid        => '1003',
    shell      => '/bin/bash',
    home       => '/home/riley',
    managehome => false,
  }
}
