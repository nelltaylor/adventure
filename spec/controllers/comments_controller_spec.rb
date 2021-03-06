
require 'spec_helper'
require 'rails_helper'

describe CommentsController do
  context "routing" do
    let(:user){ FactoryGirl.build(:user) }
    let(:post){FactoryGirl.build(:post)}
    let(:comment){ FactoryGirl.build(:comment) }

    it "routes /comments to comments#index" do
      {:get => "/comments"}.should
        route_to({:controller => "comments", :action => "index", :id => user.id, :locale => "en"})
    end

    it "routes /comments/new to comments#new" do
      {:get => "/comments/new"}.should
        route_to({:controller => "comments", :action => "new", :id => post.id, :locale => "en"})
    end

    it "routes /comments(.:name) to comments#create" do
    	# ser = FactoryGirl.create(:user)
    	# page.set_rack_session(user_id: ser.id)
      {:post => "/comments(.:#{post.id})"}.should
        route_to({:controller => "comments", :action => "create", :id => user.id, :comment => {text: "#{comment.text}"}, :locale => "en"})
    end

    it "routes /comments/:id/voteup to comments#voteup" do
      {:post => "/comments/#{post.id}/voteup?name=#{comment.id}"}.should
        route_to({:controller => "comments", :action => "voteup", :id => user.id, :locale => "en"})
    end

    it "routes /comments/:id/votedown to comments#votedown" do
      {:post => "/comments/#{post.id}/votedown?name=#{comment.id}"}.should
        route_to({:controller => "comments", :action => "votedown", :id => user.id, :locale => "en"})
    end

  end

end