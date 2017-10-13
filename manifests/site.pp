# Specific agents defined on top under node declaration
node 'srv5.riley.science' {    # Specify specific node
  file {'/root/hello.txt' :
    ensure  => present,
    mode    => '0644',
    content => "THIS IS JUST A TEST XD RAWR",
  }
}

node 'srv.fasterdevops.com' {    # Specify specific node
    include resources
}

node 'dev.fasterdevops.com' {
    include resources
}

node 'silver.fasterdevops.com' {
    include resources
}


# Manage users
  user { 'kolby':
    ensure    => present,
    uid       => '1002',
    shell     => '/bin/bash',
    home      => '/home/kolby',
    managehome => false,
}

  user { 'riley':
    ensure    => present,
    uid       => '1003',
    shell     => '/bin/bash',
    home      => '/home/riley',
    managehome => false,
}


# Add files in /etc/puppetlabs/modules/resources/files/

node default {}
