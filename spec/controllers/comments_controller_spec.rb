require 'rails_helper'
require 'spec_helper'

describe CommentsController do

# Passes when line 11 "render partial: "new"" is added into Comments Controller in the new method, but that makes the partial not render in the actual website
    describe "GET#new" do
      let(:comment) {FactoryGirl.create(:comment)}
      it "renders a partial for new comments" do
        get :new, comment: comment.attributes
        expect(response).to render_template :'comments/_new'
      end
    end

    describe do
    end

end
