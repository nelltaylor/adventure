class CommentsController < ApplicationController

	def index
  end

  def create
    @comment = Comment.create(text: params[:text], commenter_id: @current_user.id)
    redirect_to post_path(@post)
  end

end
