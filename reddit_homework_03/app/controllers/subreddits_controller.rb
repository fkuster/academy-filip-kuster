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
      @subreddit = Subreddit.new(user_params)
      if @subreddit.save
        redirect_to frontpage_path
      else
        render :new
      end
  end

def user_params
  params.require(:subreddit).permit(:name, :description)
end




end
