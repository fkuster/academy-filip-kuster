class SubscriptionsController < ApplicationController

  def new
    current_user.subscriptions.create(subreddit_id:params[:subreddit_id])
  end
  def destroy
    current_user.subscriptions.find_by(subreddit_id:params[:subreddit_id]).destroy

  end
end
