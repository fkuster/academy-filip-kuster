require 'rails_helper'
RSpec.describe CommentsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  let(:subreddit) { FactoryGirl.create(:subreddit,name:"Test") }
  let(:post) { FactoryGirl.create(:post,subreddit_id:subreddit.id) }
  let(:comment) { FactoryGirl.create(:comment) }
  before {sign_in user}

  let(:valid_attributes) {
    { content:comment.content,subreddit_id:subreddit.id, post_id:post.id}
  }

  let(:invalid_attributes) {
    { content:''}
  }

  describe "POST #create" do
    context "when valid" do
      it "creates a new Comment" do
        expect {
          post :create, attr: valid_attributes
        }.to change(Comment, :count).by(1)
      end
      it "does send an email" do
        expect(ActionMailer::Base.deliveries.empty?).to eq(false)
      end
      it "redirects to the index page" do
        post :create, comment: valid_attributes
        expect(response).to redirect_to(subreddit_post_path)
      end
    end
    context "with invalid" do
      it "re-renders new" do
        post :create, comment: invalid_attributes
        expect(response).to render_template(:new)
      end
      it "does not send an email" do
        expect(ActionMailer::Base.deliveries).to be_empty
      end
    end
  end
end
