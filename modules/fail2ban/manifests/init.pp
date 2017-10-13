## Class for setting up fail2ban

class fail2ban {

  package { 'fail2ban' :
    ensure    => latest,
    provider  => 'yum',
  }

  file { '/etc/fail2ban' :
    ensure   => directory,
    owner    => 'root',
    require  => Package['fail2ban'],
  }

  file { '/etc/fail2ban/jail.conf' :
    ensure   => file,
    owner    => 'root',
    content  => template("fail2ban/jail.conf.erb"),
    require  => File['/etc/fail2ban'],
    notify   => Service['fail2ban'],
  }

  service { 'fail2ban' :
    ensure    => running,
    provider  => 'systemd',
    require   => Package['fail2ban'],
    subscribe => File['/etc/fail2ban/jail.conf'],
  }

}
