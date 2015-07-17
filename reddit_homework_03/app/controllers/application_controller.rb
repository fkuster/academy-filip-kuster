class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!,:subreddits


  protect_from_forgery with: :exception
  private
    def subreddits
      if user_signed_in?
        user = User.find(current_user.id)
        @subreddits = user.subreddits
        @subreddit_ids = user.subreddits.pluck(:subreddit_id)
        #@subreddits=Subreddit.find(@subreddit_ids)
      end
    end
end
