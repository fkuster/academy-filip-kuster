class PostsController < ApplicationController

  def show
      @subreddit=Subreddit.find(params[:subreddit_id])
      @post=@subreddit.posts.find(params[:id])
  end

end
