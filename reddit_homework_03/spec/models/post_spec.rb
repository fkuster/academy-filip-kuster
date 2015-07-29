require "rails_helper"
RSpec.describe Post, type: :model do

  context 'test order scope' do
    let(:sport) { FactoryGirl.create(:post, updated_at:Time.now) }
    let(:infinum) { FactoryGirl.create(:post, updated_at:Time.now + 1) }
    let(:gaming) { FactoryGirl.create(:post, updated_at:Time.now + 2) }
    it 'order by date' do
      expect(Post.sorted_desc).to eq([gaming, infinum, sport])
    end
  end

  context 'test validations' do
    let(:post) { FactoryGirl.build(:post) }
    it 'validates presence of title' do
      expect(post.title.nil?).to eq(false)
    end
    it 'validates presence of content' do
      expect(post.content.nil?).to eq(false)
    end
  end

  context 'test associations' do
    let(:post) { FactoryGirl.build(:post) }
    it { should have_many(:comments) }
    it { should have_many(:upvotes) }
    it { should belong_to(:subreddit) }
    it { should belong_to(:user) }
  end
end
