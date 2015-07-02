require 'spec_helper'

describe String do
  it 'dashify can replace spaces' do
    expect('gabba gabba'.dashify).to eq('gabba-gabba')
  end

  it 'dashify can replace spaces and commas' do
    expect('what, no way!'.dashify).to eq('what--no-way!')
  end

  it 'dashify can replace underscores' do
    expect('ruby_loves_snake_case'.dashify).to eq('ruby-loves-snake-case')
  end

end
