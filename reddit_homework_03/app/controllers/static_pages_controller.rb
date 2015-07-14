class StaticPagesController < ApplicationController

  def index

  #  @posts = Post.paginate(:page => params[:page], :per_page => 20)

      @posts=Post.where(subreddit_id:@subreddit_ids).sorted_desc.paginate(:page => params[:page], :per_page => 20)
  end

end
