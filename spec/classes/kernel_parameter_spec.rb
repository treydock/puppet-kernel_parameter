require 'spec_helper'

describe 'kernel_parameter' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('kernel_parameter') }
  it { should contain_class('kernel_parameter::params') }

  it { should have_kernel_parameter_resource_count(0) }

  context  "with values => {'elevator' => {'value' => 'deadline'}}" do
    let :params do
      {
        :values => {
          'elevator' => {'value' => 'deadline'},
        },
      }
    end

    it { should have_kernel_parameter_resource_count(1) }

    it do
      should contain_kernel_parameter('elevator').with({
        'ensure'  => 'present',
        'value'   => 'deadline',
      })
    end
  end

  describe 'invalid values' do
    context 'with values => "foo,value,0"' do
      let(:params) {{ :values => 'foo,value,0' }}
      it { expect { should create_class('kernel_parameter') }.to raise_error(Puppet::Error, /is not a Hash/) }
    end
  end

  describe 'unsupported osfamily' do
    context 'with osfamily => "Debian"' do
      let(:facts) { default_facts.merge({ :osfamily => "Debian" }) }
      it { expect { should contain_class('kernel_parameter::params')}.to raise_error(Puppet::Error, /Unsupported osfamily: Debian/) }
    end
  end
end
