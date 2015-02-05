class CommentsController < ApplicationController

	def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params[:text], post_id: post.id, commenter_id: session[:user_id])
    if @comment.save
      redirect_to post_path(@post)
    else
      #what if comment fails?
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :commenter_id)
  end

end
