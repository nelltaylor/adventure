class RepliesController < ApplicationController

  def voteup
    post = Post.find(params[:id])
    @reply = Reply.find(params[:name])
    Vote.create(vote: true, votable: @reply, voter_id: current_user.id, vote_weight: 1)
    redirect_to post_path(post)
  end

  def votedown
    post = Post.find(params[:id])
    @reply = Reply.find(params[:name])
    Vote.create(vote: false, votable: @reply, voter_id: current_user.id, vote_weight: 1)
    redirect_to post_path(post)
  end


end
