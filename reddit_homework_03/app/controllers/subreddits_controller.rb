class SubredditsController < ApplicationController

  def new
     @subreddit = Subreddit.new
  end

  def index
     @all_subreddits = Subreddit.sorted_desc.paginate(:page => params[:page], :per_page => 20)
  end

  def show
     @subreddit = Subreddit.find(params[:id])
     if params[:trending] == "true"
        @posts = @subreddit.posts.includes(:user).sorted_desc

        @posts = @posts.sort_by{|post| calculate_trending(post)}

        @posts = @posts.reverse.paginate(:page => params[:page], :per_page => 20)
     else
        @posts = @subreddit.posts.includes(:user).sorted_desc.paginate(:page => params[:page], :per_page => 20)
     end
  end


  def create
      @subreddit = Subreddit.new(subreddit_params)
      if @subreddit.save
        @subreddit.subscriptions.create(user_id:current_user.id)
        redirect_to frontpage_path
      else
        render :new
      end
  end

  private
    def subreddit_params
       params.require(:subreddit).permit(:name, :description).merge(user_id: current_user.id)
    end




end
