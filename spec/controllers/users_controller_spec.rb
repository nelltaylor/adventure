require 'rails_helper'

describe UsersController do
  #   context "User signed in" do
  #   let(:user) { FactoryGirl.create(:user) }
  #   before do
  #     sign_in_as user
  #     get :index
  #   end
  #   it { should redirect_to(user_path(user)) }
  # end

  # context "signed out" do
  #   before do
  #     sign_out
  #     get :index
  #   end
  #   it { should redirect_to(root_url) }
  # end


  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

end