class UpvotesController < ApplicationController

  def new
    @post_id=params[:id]
    @counter=0
    if(Upvote.find_by(post_id:params[:id]).nil?)
        Upvote.create(post_id:params[:id],counter:1)
    else
        upvote = Upvote.find_by( post_id: params[:id] )
        upvote.counter+=1
        @counter = upvote.counter
        upvote.save
    end
    respond_to do |format|
           format.js {}
           format.html {}
       end
  end
end
