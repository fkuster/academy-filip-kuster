require "rails_helper"
RSpec.describe Subreddit, type: :model do

  context 'test order scope' do
    let(:sport) { FactoryGirl.create(:subreddit, name:"Sport") }
    let(:infinum) { FactoryGirl.create(:subreddit, name:"Infinum") }
    let(:gaming) { FactoryGirl.create(:subreddit, name:"Gaming") }
    it 'order by date' do
      expect(Subreddit.sorted_desc).to eq([gaming, infinum, sport])
    end
  end

  context 'test validations' do
    let(:subreddit) { FactoryGirl.build(:subreddit) }
    it 'validates presence of description' do
      expect(subreddit.description.nil?).to eq(false)
    end
    it 'validates presence of name' do
      expect(subreddit.name.nil?).to eq(false)
    end
  end

  context 'test associations' do
    let(:subreddit) { FactoryGirl.build(:subreddit) }
    it { should have_many(:posts) }
    it { should have_many(:subscriptions) }
    it { should have_many(:users) }
    it { should belong_to(:user) }
  end
end
