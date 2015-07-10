class PostsController < ApplicationController

  def show
      @subreddit=Subreddit.find(params[:subreddit_id])
      @post=@subreddit.posts.find(params[:id])
      @comment=Comment.new
  end

  def new
    @post=Post.new
  end

  def create
    @post = Post.new(all_params)
    if @post.save
      redirect_to frontpage_path
    else
      render :new
    end
  end
  def all_params
    all_params = params.require(:post).permit(:title, :content)
    all_params[:subreddit_id]=params['subreddit_id']
    all_params
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(all_params)
    redirect_to frontpage_path
    else
    render :edit
    end
  end


  def destroy
    Post.find(params[:id]).destroy
    redirect_to frontpage_path
  end


end
