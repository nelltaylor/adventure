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
    Vote.create(vote: true, votable: @post, voter_id: current_user.id, vote_weight: 1)
    redirect_to post_path(@post)
  end

  def votedown
    @post = Post.find(params[:id])
    Vote.create(vote: false, votable: @post, voter_id: current_user.id, vote_weight: 1)
    redirect_to post_path(@post)
  end
end
