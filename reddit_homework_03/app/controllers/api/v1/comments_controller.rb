module Api
  module V1
     class CommentsController < ApiController

        def index
           expose Post.find(params[:post_id]).comments.paginate(page: params[:page]), each_serializer: CommentSerializer
        end

        def create
           expose Post.find(params[:post_id]).comments.create(comment_params), serializer: CommentSerializer
        end

        def destroy
           expose Post.find(params[:post_id]).comments.find(params[:id]).destroy, serializer: CommentSerializer
        end

        private
          def comment_params
            params.require(:comment).permit(:content).merge(user_id:@user.id)
          end


     end
  end
end
