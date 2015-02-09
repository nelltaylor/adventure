require 'spec_helper'
require 'rails_helper'

describe TagsController do
  context "routing" do
    let(:post){FactoryGirl.build(:post)}
    let(:tag){ FactoryGirl.build(:tag) }

    it "routes /tags to tags#index" do
      {:get => "/tags"}.should
        route_to({:controller => "tags", :action => "index", :locale => "en"})
    end

    it "routes /tags/new to tags#new" do
      {:get => "/tags/new"}.should
        route_to({:controller => "tags", :action => "new", :locale => "en"})
    end

    it "routes /tags(.:name) to tags#create" do
      {:post => "/tags(.:#{post.id})"}.should
        route_to({:controller => "tags", :action => "create", :locale => "en"})
    end

  end

end