class StaticPagesController < ApplicationController

  def index
     @subreddit_ids =current_ user.subreddits.pluck(:subreddit_id)
     @posts=Post.where(subreddit_id:@subreddit_ids).includes(:user).sorted_desc.paginate(:page => params[:page], :per_page => 20)
  end

end
