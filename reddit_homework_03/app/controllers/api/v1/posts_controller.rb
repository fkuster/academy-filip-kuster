module Api
  module V1
     class PostsController < ApiController

        def index
           expose Subreddit.find(params[:subreddit_id]).posts.paginate(page: params[:page])
        end

        def show
           expose Subreddit.find(params[:subreddit_id]).posts.find(params[:id])
        end

        def create
           expose Subreddit.find(params[:subreddit_id]).posts.create(post_params)
        end

        def update
           expose Subreddit.find(params[:subreddit_id]).posts.find(params[:id]).update(post_params)
        end

        def destroy
           expose Subreddit.find(params[:subreddit_id]).posts.find(params[:id]).destroy
        end

        def upvote
          expose Subreddit.find(params[:subreddit_id]).posts.find(params[:id]).create
        end

        private
          def post_params
            params.require(:post).permit(:title, :content)
          end


     end
  end
end
