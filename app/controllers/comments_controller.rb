class CommentsController < ApplicationController

	def index
  end

  def create
    @comment = Comment.create(params[:comment])
    #redirect_to
  end

end
