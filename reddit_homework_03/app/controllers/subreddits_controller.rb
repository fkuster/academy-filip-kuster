class SubredditsController < ApplicationController

  def new
     @subreddit=Subreddit.new
  end

  def index
     @all_subreddits=Subreddit.sorted_desc.paginate(:page => params[:page], :per_page => 20)
  end

  def show
     @subreddit=Subreddit.find(params[:id])
  end


  def create
      @subreddit = Subreddit.new(subreddit_params)
      if @subreddit.save
        @subreddit.subscriptions.create(user_id:session["warden.user.user.key"][0][0],subreddit_id:@subreddit.id)
        redirect_to frontpage_path
      else
        render :new
      end
  end

  private
    def subreddit_params
      params.require(:subreddit).permit(:name, :description)
    end




end
