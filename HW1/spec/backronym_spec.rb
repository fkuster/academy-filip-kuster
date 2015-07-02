require 'spec_helper'

describe '#backronym' do
  it 'wars backronym' do
    expect(make_backronym('wars')).to eq('weird awesome rant stylish')
  end

  it 'interesting backronym' do
    expect(make_backronym('interesting')).to eq('ingestable newtonian turn eager rant eager stylish turn ingestable newtonian gregarious')
  end
end
