# == Class: kernel_parameter::params
#
# The kernel_parameter configuration settings.
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2014 Trey Dockendorf
#
class kernel_parameter::params {

  $values = $::kernel_parameter_values ? {
    undef   => false,
    default => $::kernel_parameter_values,
  }

  case $::osfamily {
    'RedHat': {
      # Valid osfamily
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only support osfamily RedHat")
    }
  }

}