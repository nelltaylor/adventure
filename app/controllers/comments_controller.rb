class CommentsController < ApplicationController

	def index
    @comments = Comment.all
    #change this to be specific to the post
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

  private

  def comment_params
    params.require(:comment).permit(:text, :commenter_id)
  end

end
