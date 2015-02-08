class TagsController < ApplicationController
	respond_to :html, :js
  skip_before_action :verify_authenticity_token

  def index
    @tag = Tag.find_by(params[:tag])
    if @tag
      @posts = @tag.posts
    else
      @posts = []

    end
    render 'index'
  end

	def new
    @tag = Tag.new
	end

	def create
		@tag = Tag.create(tag_params)
		@post =Post.find(params[:id])
	end
end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

