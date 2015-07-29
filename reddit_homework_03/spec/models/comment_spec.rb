require "rails_helper"
RSpec.describe Comment, type: :model do

  context 'test order scope' do
    let!(:a) { FactoryGirl.create(:comment) }
    let!(:b) { FactoryGirl.create(:comment) }
    let!(:c) { FactoryGirl.create(:comment) }
    it 'order by date' do
      expect(Comment.sorted_desc).to eq([c, b, a])
    end
  end

  context 'test validations' do
    let(:comment) { FactoryGirl.build(:comment) }
    it 'validates presence of content' do
      expect(comment.content.nil?).to eq(false)
    end
  end

  context 'test associations' do
    let(:comment) { FactoryGirl.build(:comment) }
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end
end
