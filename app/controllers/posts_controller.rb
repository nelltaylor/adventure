class PostsController < ApplicationController

  respond_to :html, :js
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.all.order("created_at desc")
  end

  def new
  end

  def create
    post_params = params[:posts]
    if session[:user_id]
      @post = Post.create(title: post_params[:title], image_url: post_params[:image_url], author_id: session[:user_id])
      redirect_to @post
    else
      flash[:error] = 'You need to log in to upload a photo!'
      render 'new'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    respond_to do |format|
      format.html { render :layout => false }
      format.json { render :layout => false }
    end
  end

  def popular
    @posts = Post.most_popular
      respond_to do |format|
      format.html { render :layout => false }
      format.json { render :layout => false }
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(title: params[:post][:title], image_url: params[:post][:image_url], author_id: session[:user_id])
    redirect_to @post
  end

  def show_reply_form
    render :partial => "replies/show"
  end

  def voteup
    @post = Post.find(params[:id])
    if current_user
      Vote.create(vote: true, votable: @post, voter_id: current_user.id, vote_weight: 1)
      redirect_to post_path(@post)
    else
      flash[:notice] ="Please sign in to vote!!!!!!"
      redirect_to post_path(@post)
    end
  end

  def votedown
    @post = Post.find(params[:id])
    if current_user
      Vote.create(vote: false, votable: @post, voter_id: current_user.id, vote_weight: 1)
      redirect_to post_path(@post)
    else
      flash[:notice] ="Please sign in to vote!!!!!!"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

end
