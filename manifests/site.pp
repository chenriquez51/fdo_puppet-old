# Specific agents defined on top under node declaration

node 'srv.fasterdevops.com' {    # Specify specific node
    include resources
    include resources::users
    include fasterdevops
    include fail2ban
}

node 'dev.fasterdevops.com' {
    include resources
    include resources::users
    include fail2ban
}

node 'silver.fasterdevops.com' {
    include resources
    include resources::users
    include fail2ban
}



node default {}
