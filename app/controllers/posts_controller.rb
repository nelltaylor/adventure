class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new


  end

  def create
    post_params = params[:posts]
    @post = Post.create(title: post_params[:title], image_url: post_params[:image_url], author_id: session[:user_id])
    redirect_to '/'
  end

  def voteup
    @post = Post.find(params[:id])
    # @post.upvote_by current_user
    redirect_to action: "show", controller: 'posts'
  end

  def votedown
     @post = Post.find(params[:id])

    # @post.downvote_by current_user
    redirect_to action: "show", controller: 'posts'
  end


end
