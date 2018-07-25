require 'spec_helper'

describe 'mirrmaid' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do

      let(:facts) do
        facts
      end

      let(:params) {{
        :mirrors => {},
      }}

      it do
        is_expected.to contain_package('mirrmaid') .with({ :ensure => 'installed' })
      end
    end
  end
end
