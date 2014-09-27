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
    host { $::app_name:
      ensure       => 'present',
      host_aliases => [$::fqdn],
      ip           => '127.0.0.1',
      target       => '/etc/hosts',
    }
    file { "/etc/hostname":
        ensure => present,
        owner => root,
        group => root,
        mode => 644,
        content => "$::app_name\n",
        notify => Exec["set-hostname"],
      }
      exec { "set-hostname":
        command => "/bin/hostname -F /etc/hostname",
        unless => "/usr/bin/test `hostname` = `/bin/cat /etc/hostname`",
        notify => Service[$rsyslog::params::service_name],
      }
}
