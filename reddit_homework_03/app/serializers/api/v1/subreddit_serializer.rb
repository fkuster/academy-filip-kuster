module Api
  module V1
    class SubredditSerializer < ActiveModel::Serializer
      attributes :id, :name, :description, :excerpt, :recent_posts


      def excerpt
        object.description.truncate(140)
      end

      def recent_posts
        object.posts.last(10)
      end
      
      has_many :recent_posts, serializer: PostSerializer

    end
  end
end
