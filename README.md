# puppet-kernel_parameter

[![Build Status](https://travis-ci.org/treydock/puppet-kernel_parameter.png)](https://travis-ci.org/treydock/puppet-kernel_parameter)

## Overview

The kernel_parameter puppet module is a wrapper for the kernel_parameter type provided by the [domcleal/augeasproviders](http://forge.puppetlabs.com/domcleal/augeasproviders) module.

The initial purpose of this module is to allow kernel_parameter resources to be defined from an ENC.

## Reference

### Class: kernel_parameter

Providing a Hash to the *parameters* parameter will define kernel_parameter resources.  The example below will add `vm.swappiness = 0` to /etc/kernel_parameter.conf and execute `kernel_parameter -w vm.swappiness=0`.

    class { 'kernel_parameter':
      values  => {
        'vm.swappiness' => { 'value' => '0' },
      },
    }

The top-scope variable *kernel_parameter_values* can also be used to define kernel_parameter resources as long as the kernel_parameter class is included.

    $kernel_parameter_values  = {
      'vm.swappiness' => { 'value' => '0' },
    }

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake ci

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake spec:system

## Further Information

* [augeasproviders](http://augeasproviders.com/)
