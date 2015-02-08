class CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token

	def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    # @post = Post.find(params[:id])
    @comment = Comment.create(comment_params)
    # @comment.post_id = @post.id
    # @comment.commenter_id = current_user.id
  end

  def voteup
    @post = Post.find(params[:id])
    if current_user
      @comment = Comment.find(params[:name])
      Vote.create(vote: true, votable: @comment, voter_id: current_user.id, vote_weight: 1)
      redirect_to post_path(@post)
    else
      flash[:notice] ="Please sign in to vote!!!!!!"
      redirect_to post_path(@post)
    end
  end

  def votedown
    @post = Post.find(params[:id])
    if current_user
      @comment = Comment.find(params[:name])
      Vote.create(vote: false, votable: @comment, voter_id: current_user.id, vote_weight: 1)
      redirect_to post_path(@post)
    else
      flash[:notice] ="Please sign in to vote!!!!!!"
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :commenter_id)
  end



end
