module Api
  module V1
     class PostsController < ApiController

        def index
           expose Subreddit.find(params[:subreddit_id]).posts.paginate(page: params[:page]), each_serializer: PostSerializer
        end

        def show
           expose Subreddit.find(params[:subreddit_id]).posts.find(params[:id]), serializer: PostSerializer
        end

        def create
           expose Subreddit.find(params[:subreddit_id]).posts.create(post_params), serializer: PostSerializer
        end

        def update
           expose Subreddit.find(params[:subreddit_id]).posts.find(params[:id]).update(post_params), serializer: PostSerializer
        end

        def destroy
           expose Subreddit.find(params[:subreddit_id]).posts.find(params[:id]).destroy, serializer: PostSerializer
        end

        def upvote
          expose Subreddit.find(params[:subreddit_id]).posts.find(params[:id]).upvotes.create(user_id:@user.id)
        end

        private
          def post_params
            params.require(:post).permit(:title, :content).merge(user_id:@user.id)
          end


     end
  end
end
