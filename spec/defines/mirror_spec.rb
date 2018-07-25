require 'spec_helper'

describe 'mirrmaid::mirror' do
  let(:title) { 'mirrmaid_test' }

  let(:facts) do
    {}
  end

  let(:params) {{
    :branches => {},
  }}

  let(:pre_condition) do
    'include mirrmaid'
  end

  it do
    is_expected.to contain_concat("mirrmaid-mirror-#{title}")
        .with({
          "ensure"  => "present",
          "path"    => "/etc/mirrmaid/#{title}.conf",
          "owner"   => "root",
          "group"   => "mirrmaid",
          "mode"    => "0640",
          "seluser" => "system_u",
          "selrole" => "object_r",
          "seltype" => "etc_t",
          "order"   => "numeric",
        })
        .that_subscribes_to("Package[mirrmaid]")
  end

  it do
    is_expected.to contain_concat__fragment("mirrmaid-mirror-#{title}")
        .with({
          "target" => "mirrmaid-mirror-#{title}",
          "order" => "0",
        })
  end

  it do
    is_expected.to contain_mirrmaid__mirror__default("rsync_options for mirror #{title}")
        .with({
          :mirror => "#{title}",
          :key    => "rsync_options",
          :value  => ['avHlz'],
        })
  end
end
