class PostsController < ApplicationController

  def show
      @subreddit = Subreddit.find(params[:subreddit_id])
      @post = @subreddit.posts.find(params[:id])
      @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @subreddit = Subreddit.find(params[:subreddit_id])
    @subreddit.posts.new(post_params)
    if @subreddit.save
      redirect_to frontpage_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to frontpage_path
    else
      render :edit
    end
  end


  def destroy
    Post.find(params[:id]).destroy
    redirect_to frontpage_path
  end
  private
    def post_params
      params.require(:post).permit(:title, :content).merge(user_id: current_user.id)

    end

end
