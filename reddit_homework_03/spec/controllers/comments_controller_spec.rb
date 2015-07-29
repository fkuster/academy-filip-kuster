require 'rails_helper'
RSpec.describe CommentsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  let(:subreddit) { FactoryGirl.create(:subreddit,name:"Test") }
  let(:subreddit_post) { FactoryGirl.create(:post,subreddit_id:subreddit.id) }
  let(:comment) { FactoryGirl.create(:comment) }
  before {sign_in user}

  let(:valid_attributes) {
    { content:comment.content}
  }

  let(:invalid_attributes) {
    { content:''}
  }

  describe "POST #create" do
    context "when valid" do
      it "creates a new Comment" do
        expect {
          request.env['HTTP_REFERER'] = '/'
          post :create, subreddit_id:subreddit.id, post_id:subreddit_post.id, comment: valid_attributes
        }.to change(Comment, :count).by(2)
      end
      it "does send an email" do
        expect(ActionMailer::Base.deliveries.empty?).to eq(false)
        ActionMailer::Base.deliveries.clear
      end

    end
    context "with invalid" do
      it "re-renders new" do
        request.env['HTTP_REFERER'] = '/'
        post :create, subreddit_id:subreddit.id, post_id:subreddit_post.id, comment: invalid_attributes
        expect(response).to redirect_to('/')
      end
      it "does not send an email" do
        expect(ActionMailer::Base.deliveries.empty?).to eq(true)
      end
    end
  end
end
