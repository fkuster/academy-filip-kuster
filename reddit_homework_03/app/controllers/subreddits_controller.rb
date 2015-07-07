class SubredditsController < ApplicationController

  def show

      @subreddit=Subreddit.find(params[:id].to_i)
  end

end
