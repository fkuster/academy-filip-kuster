module ApplicationHelper

    def is_subscribed?(subreddit_id)
       current_user.subscriptions.exists?(subreddit_id: subreddit_id)
    end

end
