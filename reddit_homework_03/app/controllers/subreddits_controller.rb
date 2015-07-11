class SubredditsController < ApplicationController

  def show
      @subreddit=Subreddit.find(params[:id])
  end

end
