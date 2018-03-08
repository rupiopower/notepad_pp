# Class: notepad_pp
# ===========================
#
# Full description of class notepad_pp here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'notepad_pp':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class notepad_pp (
  $npp_url               = 'https://notepad-plus-plus.org/repository/7.x/7.5.5/npp.7.5.5.Installer.x64.exe',
  $destination_directory = 'C:\ProgramData\PuppetLabs\puppet\etc',
  $destination_file      = 'npp.exe',
  $proxy_address         = '',
  $proxy_user            = '',
  $proxy_password        = '',
  $is_password_secure    = false
) {
  case $::osfamily {
    'Windows': {
      download_file { 'npp.exe':
        url                   => $npp_url,
        destination_directory => $destination_directory,
        destination_file      => $destination_file,
        proxy_address         => $proxy_address,
        proxy_user            => $proxy_user,
        proxy_password        => $proxy_password,
        is_password_secure    => $is_password_secure,
      }
      package { 'npp.exe':
        ensure          => installed,
        source          => "${destination_directory}\\${destination_file}",
        install_options => ['/S'],
        require         => Download_file['npp.exe'],
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}
