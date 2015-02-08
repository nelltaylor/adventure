class TagsController < ApplicationController

  def index
    tag = Tag.find_by(params[:tag])
    if tag
      @posts = tag.posts
    else
      @posts = []

    end
    render 'index'
  end

end
