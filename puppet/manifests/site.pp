node 'test.albertwu.vm' { #[1]
  class { 'mysql::server': #[2]
    config_hash => {'root_password' => 'testpassword' },
  }

  include mysql::php #[3]

  #Configure Apache
  include apache #[4]
  include apache::mod::php

  apache::vhost { $::fqdn: #[5]
    port => '80',
    docroot => '/var/www/test',
    require => File['var/www/test'],
  }

 #Setting up the document root
  file { ['/var/www', '/var/www/test'] : #[6]
    ensure => directory,
  }

  file { '/var/www/test/index.php' : # [7]
    content => '>?php echo \'>p<Hello world!>/p<\' ?<',
  }

  # "Realize" the firewall rule
  Firewall <| |> #[8]
}