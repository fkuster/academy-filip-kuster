module Api
  module V1
     class SubredditsController < ApiController

        def index
           expose Subreddit.paginate(page: params[:page])
        end

        def show
           expose Subreddit.find(params[:id])
        end

        def create
           expose Subreddit.create(subreddit_params)
        end

        def update
           expose Subreddit.find(params[:id]).update(subreddit_params)
        end

        def destroy
           expose Subreddit.find(params[:id]).destroy
        end
        private
          def subreddit_params
             params.require(:subreddit).permit(:name, :description)
          end

     end
  end
end
