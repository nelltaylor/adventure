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
    @post = Post.find(params[:id])
    
	end

	def create
		
		@post =Post.find(params[:name])
    text = params[:tag][:name]
    @tag = Tag.create(name: text)
    PostTag.create(post_id: @post.id, tag_id: @tag.id)

    respond_to do |format|
      format.html { render json: {tag: @tag} }
      format.json { render json: {tag: @tag} }
    end
	end
end

  # private

  # def tag_params
  #   params.require(:tag).permit(:name)
  # end

