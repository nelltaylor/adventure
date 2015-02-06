class CommentsController < ApplicationController

	def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
  end

  def voteup
    puts params
    post = Post.find(params[:id])
    @comment = Comment.find(params[:name])
    Vote.create(vote: true, votable: @comment, voter_id: current_user.id, vote_weight: 1)
    redirect_to post_path(post)
  end

  def votedown
    post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    Vote.create(vote: false, votable: @comment, voter_id: current_user.id, vote_weight: 1)
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :commenter_id)
  end



end
