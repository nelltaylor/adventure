require 'spec_helper'
require 'rails_helper'


describe SessionsController do
  context "routing" do
    let(:user){ FactoryGirl.build(:user) }
    let(:post){FactoryGirl.build(:post)}
    it "routes /log-in to sessions#new" do
      {:get => "/log-in"}.should
        route_to({:controller => "sessions", :action => "new", :id => user.id, :locale => "en"})
    end

    it "routes /log-in to sessions#create" do
      {:post => "/log-in"}.should
        route_to({:controller => "sessions", :action => "create", :id => user.id, :locale => "en"})
    end

    it "routes /log-out to sessions#destroy" do
      {:get => "/log-out"}.should
        route_to({:controller => "sessions", :action => "destroy", :id => user.id, :locale => "en"})
    end

  end
end