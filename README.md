Puppet-HostName
===============

This module sets a custom hostname on your AWS ec2 instance.

Tested on ubuntu Instances with 12.04 & 14.04 Versions.

##Requirements:

This class needs 2 facter varibles:

1. "custom_hostname" (string) - mandatory

Example:

custom_hostname=my_host

2. "hosts_array" (json) - optional

Example:

hosts_array={"host1" : { "ip" : "127.0.0.1" }, "host2" : { "ip" : "127.0.0.2"}}

NOTE: On Cloudformation template if you are using "user data" to creates the facter variables to preserve the double coutes you need to declare in the followinf format:

"echo hosts_array={\\\"host1\\\" : { \\\"ip\\\" : \\\"127.0.0.1\\\" }, \\\"host2\\\" : { \\\"ip\\\" : \\\"127.0.0.2\\\"}} >> /path/to/facter/file/\n",

##Steps:

1. Clone repo into your Puppet "module" folder named "hosts".
```bash
#   git clone git@github.com:victormarroquin/Puppet-HostName.git /etc/puppet/modules/hosts
```
2. Include "hosts" class in your main manifest.
```bash
#   Example: include hosts
```
