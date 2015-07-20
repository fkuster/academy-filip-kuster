class CommentsController < ApplicationController

  def create
    @post=Post.find(params[:post_id])
    @post.comments.new(comment_params)
    if @post.save
      Notifications.comments(@post,params[:content]).deliver_now
      redirect_to :back
    else
      redirect_to :back
    end
  end
  private
    def comment_params
      comment_params=params.require(:comment).permit(:content)
      comment_params[:user_id]=current_user.id
      comment_params
    end

end
