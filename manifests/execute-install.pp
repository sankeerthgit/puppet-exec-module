class toolname::executeinstall (
  $archive_name        = 'installation.zip',
){
  $repository_url      = 'https://repo/artifactory/toolname/agents'
  $package_source      = "${repository_url}/${archive_name}"
  $install_path        = '/tmp/installdump'

  file{$install_path:
    ensure => directory,
  }

  archive { $archive_name:
    path         => "${install_path}/${archive_name}",
    source       => $package_source,
    extract      => true,
    extract_path => $install_path,
    cleanup      => true,
    require      => File[$install_path],
  }

  exec { 'run_install_script':
#   path        => ["/usr/bin", "/usr/sbin", "/bin/bash"],
    command     => "${install_path}/install.sh",
    refreshonly => true,
    logoutput   => true,
    subscribe   => Archive[$archive_name],
  }
}
