require 'puppetlabs_spec_helper/module_spec_helper'

dir = File.expand_path(File.dirname(__FILE__))
Dir["#{dir}/shared_*/*.rb"].sort.each {|f| require f}
