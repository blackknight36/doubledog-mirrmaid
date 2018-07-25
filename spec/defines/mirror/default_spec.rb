require 'spec_helper'

describe 'mirrmaid::mirror::default' do
  let(:title) { 'mirror_default' }

  let(:params) {{
    :mirror => 'test_mirror',
    :key    => "rsync_options",
    :value  => nil,
  }}

  it do
    is_expected.to contain_concat__fragment("mirrmaid-mirror-test_mirror-default-#{title}")
      .with({
        "target" => "mirrmaid-mirror-test_mirror",
        "order"  => "3",
      })
  end
end
