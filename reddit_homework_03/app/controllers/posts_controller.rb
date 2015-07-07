class PostsController < ApplicationController

  def show
      @subreddit=Subreddit.find(params[:subreddit_id].to_i)
      @post=@subreddit.posts.find(params[:id].to_i)
  end

end
