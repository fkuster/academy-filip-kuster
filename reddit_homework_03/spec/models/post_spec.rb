require "rails_helper"
RSpec.describe Post, type: :model do

  context 'test order scope' do
    let(:sport) { FactoryGirl.build(:post, title:"Sport") }
    let(:infinum) { FactoryGirl.build(:post, title:"Infinum") }
    let(:gaming) { FactoryGirl.build(:post, title:"Gaming") }
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
