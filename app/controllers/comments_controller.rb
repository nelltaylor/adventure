class CommentsController < ApplicationController

	def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      #what if comment fails?
    end
  end

    def voteup
    @comment = Comment.find(params[:id])

    @comment.upvote_by current_user
    redirect_to action: "show", controller: 'posts'
  end

  def votedown
     @comment = Comment.find(params[:id])

    @comment.downvote_by current_user
    redirect_to action: "show", controller: 'posts'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :commenter_id)
  end



end
