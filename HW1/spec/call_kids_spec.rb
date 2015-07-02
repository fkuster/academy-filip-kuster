require 'spec_helper'

describe '#call_kids' do
  it 'danica has two kids' do
    danko  = Child.new('Danko', '02121213')
    dinko  = Child.new('Dinko', '34235252')
    danica = Mother.new('Danica', [danko, dinko])

    expect(danica.kids).to eq([danko, dinko])
  end


  it 'danica has two kids named Danko and Dinko' do
    danko  = Child.new('Danko', '02121213')
    dinko  = Child.new('Dinko', '34235252')
    danica = Mother.new('Danica', [danko, dinko])

    expect(danica.kid_names).to eq(['Danko', 'Dinko'])
  end

  it 'danica has two kids' do
    danko  = Child.new('Danko', '02121213')
    dinko  = Child.new('Dinko', '34235252')
    danica = Mother.new('Danica', [danko, dinko])

    expect(danica.call_kids).to eq(["Calling Danko on 02121213 ...", "Calling Dinko on 34235252 ..."])
  end
end
