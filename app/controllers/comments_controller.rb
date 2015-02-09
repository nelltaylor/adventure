class CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token

	def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.find(params[:name])
    text = params[:comment][:text]
    commenter_id = current_user.id
    @comment = Comment.create(text: text, commenter_id: commenter_id, post_id: @post.id)
    # r @post
    {text: @comment.text, user: current_user.username}.to_json
    respond_to do |format|
      format.html { render json: {comment: @comment, user: current_user} }
      format.json { render json: {comment: @comment, user: current_user} }
    end
    # .to_json
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

  # def comment_params
  #   params.require(:comment).permit(:text)
  # end



end
