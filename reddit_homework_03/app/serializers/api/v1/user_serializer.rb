module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
       attributes :id, :email, :nickname, :gender, :upvotes_count, :subreddit_ids

       def upvotes_count
         object.upvotes.count
       end

    end
  end
end
