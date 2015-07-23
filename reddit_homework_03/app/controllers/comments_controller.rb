class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.comments.new(comment_params)
    if @post.save
      Notifications.comments(@post, params[:content]).deliver_now
      redirect_to :back
    else
      redirect_to :back
    end
  end
  private
    def comment_params
       params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end

end
