module Api
  module V1
     class SubredditsController < ApiController

        def index
           expose Subreddit.paginate(page: params[:page]), each_serializer: SubredditSerializer
        end

        def show
           expose Subreddit.find(params[:id]), serializer: SubredditSerializer
        end

        def create
           expose Subreddit.create(subreddit_params), serializer: SubredditSerializer
        end

        def update
           expose Subreddit.find(params[:id]).update(subreddit_params), serializer: SubredditSerializer
        end

        def destroy
           expose Subreddit.find(params[:id]).destroy, serializer: SubredditSerializer
        end
        private
          def subreddit_params
             params.require(:subreddit).permit(:name, :description).merge(user_id:@user.id)
          end

     end
  end
end
