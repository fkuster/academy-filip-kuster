require 'rails_helper'
RSpec.describe PostsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  let(:subreddit) { FactoryGirl.create(:subreddit,name:"Test") }

  let(:subreddit_post) { FactoryGirl.create(:post,subreddit_id:subreddit.id) }

  before {sign_in user}

  let(:valid_attributes) {
    { title: subreddit_post.title, content: subreddit_post.content }
  }

  let(:invalid_attributes) {
    {title:'', content:'' }
  }

  describe "GET #new" do
    it "renders new" do
      get :new, subreddit_id:subreddit.id
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end
  describe "GET #show" do
    it "renders show" do
      get :show, subreddit_id:subreddit.id, id:subreddit_post.id
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end

  describe "GET #destroy" do
    it "destroy a Post" do
    #  expect {
    #    delete :destroy, subreddit_id:subreddit.id, id:post.id
    #  }.to change(Post, :count).by(-1)
      delete :destroy, subreddit_id:subreddit.id, id:subreddit_post.id
      expect(response).to redirect_to(frontpage_path)
    end
  end

  describe "POST #create" do
    context "when valid" do
      it "creates a new Post" do
        expect {
          post :create, subreddit_id:subreddit.id, post: valid_attributes
        }.to change(Post, :count).by(2)
      end
      it "redirects to the index page" do
        post :create, subreddit_id:subreddit.id, post: valid_attributes
        expect(response).to redirect_to(frontpage_path)
      end
    end
    context "with invalid" do
      it "re-renders new" do
        post :create, subreddit_id:subreddit.id, post: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end
  describe "PUT #update" do
    context "when valid" do
      it "updates a Post" do
          put :update, subreddit_id:subreddit.id, id:subreddit_post, post: valid_attributes
          expect(response).to redirect_to(frontpage_path)
      end

    end
    context "with invalid" do
      it "re-renders new" do
        put :update, subreddit_id:subreddit.id, id:subreddit_post, post: invalid_attributes
        expect(response).to render_template(:edit)
      end
    end
  end
end
