module ApplicationHelper

    def is_subscribed?(subreddit_id)
      subscriptions=Subscription.where(user_id:session["warden.user.user.key"][0][0],subreddit_id:subreddit_id)
      if subscriptions.empty?
        return  false
      else
        return true
      end
    end

end
