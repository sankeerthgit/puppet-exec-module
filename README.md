# puppet-exec-module
Puppet module for install and execute commands.

A Puppet module to install and execute commands.

Basic usage

To install any exec package using puppet:

  exec { 'run_install_script':
  command     => "${install_path}/install.sh",
