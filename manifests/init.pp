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
      host_aliases => [$::custom_hostname],
      ip           => '127.0.0.1',
      target       => '/etc/hosts',
    }
    file { "/etc/hostname":
        ensure => present,
        owner => root,
        group => root,
        mode => 644,
        content => "$::custom_hostname\n",
        notify => Exec["set-hostname"],
      }
      exec { "set-hostname":
        command => "/bin/hostname -F /etc/hostname",
        unless => "/usr/bin/test `hostname` = `/bin/cat /etc/hostname`",
      }
}
