class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!


  protect_from_forgery with: :exception


  def calculate_trending(post)
    current_time = DateTime.now
    hours = (current_time.to_i - post.created_at.to_i)/3600
    (post.upvotes.count - 1)/(hours + 2)**1.8
  end

end
