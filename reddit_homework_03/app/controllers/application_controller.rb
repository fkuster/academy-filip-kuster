class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :subreddits

  protect_from_forgery with: :exception
  private
    def subreddits
      @subreddits=Subreddit.take(10)
    end
end
