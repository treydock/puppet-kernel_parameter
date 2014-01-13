# == Class: kernel_parameter
#
# Full description of class kernel_parameter here.
#
# === Parameters
#
# [*values*]
#   Hash or false.  Hash to be passed to define kernel_parameter resources.
#   Default: false
#
# === Variables
#
# [*kernel_parameter_values*]
#   Hash used to define kernel_parameter resources.
#
# === Examples
#
#  # Define kernel_parameter resources
#  class { 'kernel_parameter':
#    values => {
#      'elevator' => {
#        'value' => 'deadline',
#      },
#    },
#  }
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2014 Trey Dockendorf
#
class kernel_parameter (
  $values = $kernel_parameter::params::parameters
) inherits kernel_parameter::params {

  if $values { validate_hash($values) }

  if $values and !empty($values) {
    $defaults = {
      'ensure'    => 'present',
    }
    create_resources(kernel_parameter, $values, $defaults)
  }

}
