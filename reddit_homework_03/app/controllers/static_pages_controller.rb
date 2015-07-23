class StaticPagesController < ApplicationController

  def index

    @subreddit_ids = current_user.subreddits.pluck(:subreddit_id)
    if params[:trending]=="true"
       @posts = Post.where(subreddit_id:@subreddit_ids).includes(:user).sorted_desc

       @posts = @posts.sort_by{|post| calculate_trending(post)}

       @posts = @posts.reverse.paginate(:page => params[:page], :per_page => 20)
    else
       @posts = Post.where(subreddit_id:@subreddit_ids).includes(:user).sorted_desc.paginate(:page => params[:page], :per_page => 20)
    end


  end

end
