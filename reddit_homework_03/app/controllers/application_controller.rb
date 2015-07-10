class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :subreddits
  
  def subreddits
    @subreddits=Subreddit.take(10)
  end

  protect_from_forgery with: :exception
end
