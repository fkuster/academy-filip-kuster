require "rails_helper"
RSpec.describe User, type: :model do

  context 'token is created' do
    let(:user) { FactoryGirl.create(:user) }
    it 'validates presence of token' do
      expect(user.token.nil?).to eq(false)
    end
  end

  context 'email is present' do
    let(:user) { FactoryGirl.build(:user) }
    it 'validates presence of email' do
      expect(user.email.nil?).to eq(false)
    end
  end

  context 'test associations' do
    let(:user) { FactoryGirl.build(:user) }
    it { should have_many(:comments) }
    it { should have_many(:subscriptions) }
    it { should have_many(:upvotes) }
    it { should have_many(:subreddits) }
  end
end
