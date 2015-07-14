class SubscriptionsController < ApplicationController

  def show
    Subscription.create(user_id:session["warden.user.user.key"][0][0],subreddit_id:params[:id])
    respond_to do |format|
           format.js {}
           format.html {}
       end
  end
  def destroy
    Subscription.where(user_id:session["warden.user.user.key"][0][0],subreddit_id:params[:id]).destroy_all
    respond_to do |format|
           format.js {}
           format.html {}
       end
  end
end
