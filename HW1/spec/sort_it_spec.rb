require 'spec_helper'

describe '#sort_it' do
  it 'can sort by the 2nd letter' do
    expect(sort_it('bill, bell, ball, bull', 2)).to eq('ball, bell, bill, bull')
  end

  it 'can sort by the 3rd letter' do
    expect(sort_it('cat, dog, eel, bee', 3)).to eq('bee, dog, eel, cat')
  end

  it 'can sort long words' do
    expect(sort_it("Wolfgang Mittermeyer, Paul von Oberstein, Adalbert von Fahrenheit, Karl Gustav Kempf, Neidhardt Muller", 6)).to eq("Karl Gustav Kempf, Wolfgang Mittermeyer, Neidhardt Muller, Adalbert von Fahrenheit, Paul von Oberstein")
  end
end
