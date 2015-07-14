class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!,:subreddits


  def subreddits
    if user_signed_in?
      user = User.find(session["warden.user.user.key"][0][0])
      @subreddit_ids = user.subscriptions.pluck(:subreddit_id)
      @subreddits=Subreddit.find(@subreddit_ids)
    end
  end

  protect_from_forgery with: :exception
end
