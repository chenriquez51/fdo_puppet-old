# Basic base configuration for servers
#
#
class resources {

 $base_packages = ['python34', 'lsof', 'git', 'zsh', 'tmux', 'curl', 'whois', 'ntp', 'htop', 'bind-utils']

 $python_packages = ['paramiko', 'fabric', 'pep8', 'pylint']

  file { '/etc/motd' :
    source    => 'puppet:///modules/resources/motd',
    mode      => '0644',
    owner     => 'root',
 }

  file {'/root/.ssh/authorized_keys' :
    source    => 'puppet:///modules/resources/riley_sshkey',
    mode      => '0600',
    owner     => 'root',
 }

  file { '/root/.vimrc' :
    source    => 'puppet:///modules/resources/vimrc',
    mode      => '0655',
    owner     => 'root',
  }

  file { '/opt' :
    ensure    => 'directory',
    mode      => '0655',
    owner     => 'root',
  }

  exec { 'install_pip' :
    command   => '/usr/bin/easy_install pip',
    user      => 'root',
  }

  exec { 'yum update' :
    command   => '/usr/bin/yum update -y',
    user      => 'root',
    require   => Package[$base_packages],
  }


  package { $base_packages: ensure => latest, provider => 'yum',}

  package { $python_packages: ensure => latest, provider => 'pip', require => Exec['install_pip'],}

}
