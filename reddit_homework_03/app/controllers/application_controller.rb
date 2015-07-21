class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!,:subreddits


  protect_from_forgery with: :exception

  def calculate_trending(post)
    current_time = DateTime.now
    hours = (current_time.to_i - post.created_at.to_i)/3600
    (post.upvotes.count - 1)/(hours + 2)**1.8
  end

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
