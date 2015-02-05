class CommentsController < ApplicationController

	def index
  end

  def new
  end

  def create
    @comment = Comment.new(text: params[:text], post_id: post.id, commenter_id: session[:user_id])
    @comment.save
    #redirect_to post_path(@post)
  end

end
