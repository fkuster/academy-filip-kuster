class SubscriptionsController < ApplicationController

  def new
    Subscription.create(user_id:session["warden.user.user.key"][0][0],subreddit_id:params[:subreddit_id])
    respond_to do |format|
           format.js {}
           format.html {}
       end
  end
  def destroy
    Subscription.find_by(user_id:session["warden.user.user.key"][0][0],subreddit_id:params[:subreddit_id]).destroy
    respond_to do |format|
           format.js {}
           format.html {}
       end
  end
end
