# Basic base configuration for servers
#
#
class resources {

 $base_packages = ['python34', 'git', 'zsh', 'tmux', 'curl', 'whois', 'ntp', 'htop', 'bind-utils']

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


  package { $base_packages: ensure => latest, provider => 'yum',}


}
