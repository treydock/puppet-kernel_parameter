require 'spec_helper_system'

describe 'kernel_parameter class:' do
  context 'with default parameters' do
    it 'should run successfully' do
      pp =<<-EOS
        class { 'kernel_parameter': }
      EOS
  
      puppet_apply(pp) do |r|
       r.exit_code.should_not == 1
       r.refresh
       r.exit_code.should be_zero
      end
    end

    describe file('/boot/grub/menu.lst') do
      its(:content) { should_not match /elevator=/ }
    end
  end

  context 'defining values parameter' do
    it 'should run successfully' do
      pp =<<-EOS
        class { 'kernel_parameter': 
          values  => {'elevator' => { 'value' => 'deadline' }},
        }
      EOS

      puppet_apply(pp) do |r|
       r.exit_code.should_not == 1
       r.refresh
       r.exit_code.should be_zero
      end
    end

    describe file('/boot/grub/menu.lst') do
      its(:content) { should match /elevator=deadline/ }
    end
  end
end
