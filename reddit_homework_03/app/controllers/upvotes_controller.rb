class UpvotesController < ApplicationController

  def new
    @post_id = params[:post_id]
    Upvote.find_or_create_by(post_id:params[:post_id],user_id:current_user.id)
    @counter = Post.find(params[:post_id]).upvotes.count
    respond_to do |format|
           format.js {}
           format.html {}
       end
  end
end
