module Api
  module V1
     class CommentsController < ApiController

        def index
           expose Post.find(params[:post_id]).comments.paginate(page: params[:page])
        end

        def create
           expose Post.find(params[:post_id]).comments.create(comment_params)
        end

        def destroy
           expose Post.find(params[:post_id]).comments.find(params[:id]).destroy
        end

        private
          def comment_params
            params.require(:comment).permit(:content)
          end


     end
  end
end
