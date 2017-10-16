# Specific agents defined on top under node declaration

node 'srv.fasterdevops.com' {    # Specify specific node
    require resources
    include resources::users
    include fasterdevops
    include fail2ban
}

node 'dev.fasterdevops.com' {
    require resources
    include resources::users
    include fail2ban
    tomcat::install { '/opt/tomcat':
        source_url    => 'http://mirrors.ocf.berkeley.edu/apache/tomcat/tomcat-8/v8.5.23/bin/apache-tomcat-8.5.23.tar.gz',
    }


    tomcat::instance { 'default':
        catalina_home => '/opt/tomcat',
    }

    tomcat::config::server { 'tomcat8':
        port          => '8080',
    }

}

node 'silver.fasterdevops.com' {
    require resources
    include resources::users
    include fail2ban
}



node default {}
