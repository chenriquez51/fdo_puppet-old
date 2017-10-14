# Fail2ban Module

To use the class, add this into your sites.pp or nodes.pp manifests-
```
include fail2ban
```
Right now, this only manages the jail.conf file and sets up a jail for the ssh service.


