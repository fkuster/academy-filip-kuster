require 'spec_helper'

describe '#converter' do
  it 'can convert mpg to kpl' do
    expect(converter(12)).to be(4.25)
    expect(converter(24)).to be(8.50)
    expect(converter(36)).to be(12.74)
  end
end
