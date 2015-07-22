class SubscriptionsController < ApplicationController

  def new
    Subscription.create(user_id:current_user.id,subreddit_id:params[:subreddit_id])
  
  end
  def destroy
    Subscription.find_by(user_id:current_user.id,subreddit_id:params[:subreddit_id]).destroy

  end
end
