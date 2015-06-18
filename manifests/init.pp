class hosts {
  resources {'host' :
    purge => true,
  }
    host { 'ip6-allhosts':
      ensure => 'present',
      ip     => 'ff02::3',
      target => '/etc/hosts',
    }
    host { 'ip6-allnodes':
      ensure => 'present',
      ip     => 'ff02::1',
      target => '/etc/hosts',
    }
    host { 'ip6-allrouters':
      ensure => 'present',
      ip     => 'ff02::2',
      target => '/etc/hosts',
    }
    host { 'ip6-localhost':
      ensure       => 'present',
      host_aliases => ['ip6-loopback'],
      ip           => '::1',
      target       => '/etc/hosts',
    }
    host { 'ip6-localnet':
      ensure => 'present',
      ip     => 'fe00::0',
      target => '/etc/hosts',
    }
    host { 'ip6-mcastprefix':
      ensure => 'present',
      ip     => 'ff00::0',
      target => '/etc/hosts',
    }
    host { $::fqdn:
      ensure       => 'present',
      host_aliases => $::custom_hostname,
      ip           => $::ipaddress_eth0,
      target       => '/etc/hosts',
      require	   => Exec["set-hostname"],
    }
    
    host { 'localhost':
      ensure       => 'present',
      ip           => '127.0.0.1',
      target       => '/etc/hosts',
    }
    
    exec { "set-hostname":
      command => "sudo hostnamectl set-hostname $::custom_hostname",
      unless => "/usr/bin/test `hostname` = `/bin/cat /etc/hostname`",
    }
}
