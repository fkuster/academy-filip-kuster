class UpvotesController < ApplicationController

  def new
    @post_id = params[:post_id]
    current_user.upvotes.find_or_create_by(post_id:params[:post_id])
    @counter = Post.find(params[:post_id]).upvotes_count
  end
end
