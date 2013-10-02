# Installs the Titan graph database.

class titan {
  $package = "titan-all"
  $version = "0.3.1"

  exec { "updateapt":
    command => "apt-get update",
    path => "/usr/bin"
  }

  package { "openjdk-7-jre":
    ensure => "installed",
    require => Exec["updateapt"]
  }

  package { "unzip":
    ensure => "installed",
    require => Exec["updateapt"]
  }

  file { "/usr/local/bin/start_titan":
    source => "puppet:///modules/titan/start_titan.sh",
    mode => 0755
  }

  exec { "fetchtitan":
    command => "wget http://s3.thinkaurelius.com/downloads/titan/$package-$version.zip",
    cwd => "/tmp",
    creates => "/tmp/$package-$version.zip",
    path => "/usr/bin",
    timeout => 0
  }

  exec { "extracttitan":
    command => "unzip /tmp/$package-$version.zip",
    cwd => "/usr/local",
    path => "/bin:/usr/bin",
    require => [
      Exec["fetchtitan"],
      Package["unzip"]
    ],
    creates => "/usr/local/$package-$version"
  }

  file { "/usr/local/$package-$version":
    group => "vagrant",
    owner => "vagrant",
    recurse => true,
    ensure => present,
    require => Exec["extracttitan"]
  }

  file { "/usr/local/titan":
    ensure => link,
    target => "/usr/local/$package-$version",
    require => File["/usr/local/$package-$version"]
  }
}
