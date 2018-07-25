require 'spec_helper'

describe 'mirrmaid::mirror::branch' do
  let(:title) { 'test_branch' }

  let(:facts) do
    {}
  end

  let(:params) {{
    :mirror => 'test_mirror',
    :source => nil,
    :target => nil,
  }}

  it do
    is_expected.to contain_concat__fragment("mirrmaid-mirror-test_mirror-branch-#{title}")
        .with({
          "target" => "mirrmaid-mirror-test_mirror",
          "order" => "9",
        })
  end
end
