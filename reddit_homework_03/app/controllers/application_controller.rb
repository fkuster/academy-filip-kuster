class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!,:subreddits

  def current_user
    session["warden.user.user.key"][0][0]
  end

  protect_from_forgery with: :exception
  private
    def subreddits
      if user_signed_in?
        user = User.find(current_user)
        @subreddit_ids = user.subscriptions.pluck(:subreddit_id)
        @subreddits=Subreddit.find(@subreddit_ids)
      end
    end
end
