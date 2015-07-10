class CommentsController < ApplicationController

  def create
    @comment = Comment.new(all_params)
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def all_params

   params.require(:comment).permit(:content,:post_id)

  end

end
