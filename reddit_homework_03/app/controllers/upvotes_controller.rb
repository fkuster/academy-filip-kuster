class UpvotesController < ApplicationController

  def new
    @post_id=params[:post_id]
    @counter=0
    if(Upvote.find_by(post_id:params[:post_id]).nil?)
        Upvote.create(post_id:params[:post_id],counter:1)
        @counter = 1
    else
        upvote = Upvote.find_by( post_id: params[:post_id] )
        upvote.counter+=1
        upvote.save
        @counter = upvote.counter
    end
    respond_to do |format|
           format.js {}
           format.html {}
       end
  end
end
