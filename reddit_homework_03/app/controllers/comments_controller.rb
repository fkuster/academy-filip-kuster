class CommentsController < ApplicationController

  def create
    @post=Post.find(params[:post_id])
    @post.comments.new(comment_params)
    if @post.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
