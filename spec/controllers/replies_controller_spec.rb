require 'spec_helper'
require 'rails_helper'

describe RepliesController do
  context "routing" do
    let(:user){ FactoryGirl.build(:user) }
    let(:post){FactoryGirl.build(:post)}
    let(:comment){ FactoryGirl.build(:comment) }
    let(:reply){ FactoryGirl.build(:reply) }
    it "routes /replies/new to replies#new" do
      {:get => "/replies/new"}.should
        route_to({:controller => "replies", :action => "new", :id => user.id, :locale => "en"})
    end

    it "routes /replies(.:name) to replies#new" do
      {:post => "/replies(.:#{comment.id})"}.should
        route_to({:controller => "replies", :action => "create", :id => user.id, :locale => "en"})
    end

    it "routes /replies/:id/voteup to replies#voteup" do
      {:post => "/replies/#{post.id}/voteup?name=#{comment.id}"}.should
        route_to({:controller => "replies", :action => "voteup", :id => user.id, :locale => "en"})
    end

    it "routes /replies/:id/votedown to replies#votedown" do
      {:post => "/replies/#{post.id}/votedown?name=#{comment.id}"}.should
        route_to({:controller => "replies", :action => "votedown", :id => user.id, :locale => "en"})
    end

  end

end