class RepliesController < ApplicationController

  def voteup
    @reply = Reply.find(params[:id])

    @reply.upvote_by current_user
    redirect_to :action => "show", controller: 'posts'
  end

  def votedown
     @reply = Reply.find(params[:id])

    @reply.downvote_by current_user
    redirect_to action: "show", controller: 'posts'
  end

end
