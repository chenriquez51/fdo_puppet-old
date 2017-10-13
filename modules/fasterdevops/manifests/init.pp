## Class for fasterdevops.com
#
############

class fasterdevops {

  package { 'httpd' :
    ensure     => latest,
    provider   => 'yum',
  }

  file { '/var/www/html/index.html' :
    ensure     => file,
    source     => 'puppet:///modules/fasterdevops/index.html',
    require    => Package['httpd'],
  }

  file { '/var/www/html/splash.png' :
    ensure     => file,
    source     => 'puppet:///modules/fasterdevops/splash.png',
    require    => File['/var/www/html/index.html'],
  }

  service { 'httpd' :
    ensure     => running,
    provider   => 'systemd',
    require    => File['/var/www/html/splash.png'],
  }

}

