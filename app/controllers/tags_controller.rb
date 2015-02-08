class TagsController < ApplicationController

  def search
    tag = Tag.find_by(params[:tag])
    @posts = tag.posts
    render ''

  end

end
