Puppet-HostName
===============

This module sets the hostname on your AWS ec2 instance.

##Requiremets:

This class needs a facter varible named "custom_hostname".

##Steps:

1. Clone repo into your Puppet "module" folder named "hosts".
```bash
#   git clone git@github.com:victormarroquin/Puppet-HostName.git /etc/puppet/modules/hosts
```
2. Include "hosts" class in your main manifest.
```bash
#   Example: include hosts
```
