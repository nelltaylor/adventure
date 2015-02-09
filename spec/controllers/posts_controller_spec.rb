require 'spec_helper'
require 'rails_helper'

describe PostsController do
  context "routing" do
    let(:user){ FactoryGirl.build(:user) }
    let(:post){FactoryGirl.build(:post)}
    it "routes /posts to posts#index" do
      {:get => "/posts"}.should
        route_to({:controller => "posts", :action => "index", :id => user.id, :locale => "en"})
    end

    it "routes /posts/new to posts#new" do
      {:get => "/posts/new"}.should
        route_to({:controller => "posts", :action => "new", :id => user.id, :locale => "en"})
    end

    it "routes /posts to posts#create" do
      {:post => "/posts"}.should
        route_to({:controller => "posts", :action => "create", :id => user.id, :locale => "en"})
    end

    it "routes /posts/edit to posts#edit" do
      {:get => "/posts/edit"}.should
        route_to({:controller => "posts", :action => "edit", :id => user.id, :locale => "en"})
    end

    it "routes /posts/popular to posts#popular" do
      {:get => "/posts/popular"}.should
        route_to({:controller => "posts", :action => "popular", :id => user.id, :locale => "en"})
    end

    it "routes /posts/:id to posts#show" do

      {:get => "/posts/#{post.id}"}.should
        route_to({:controller => "posts", :action => "show", :id => post.id, :locale => "en"})
    end

    it "routes /posts/:id to posts#update" do
      {:patch => "/posts/#{post.id}"}.should
        route_to({:controller => "posts", :action => "update", :id => post.id, :locale => "en"})
    end

    it "routes /posts/:id/voteup to posts#voteup" do
      {:post => "/posts/#{post.id}/voteup"}.should
        route_to({:controller => "posts", :action => "voteup", :id => post.id, :locale => "en"})
    end

    it "routes /posts/:id/votedown to posts#votedown" do
      {:post => "/posts/#{post.id}/votedown"}.should
        route_to({:controller => "posts", :action => "votedown", :id => post.id, :locale => "en"})
    end

    it "routes /posts/:id to posts#delete" do
      {:delete => "/posts/#{post.id}"}.should
        route_to({:controller => "posts", :action => "delete", :id => user.id, :locale => "en"})
    end
  end
end
