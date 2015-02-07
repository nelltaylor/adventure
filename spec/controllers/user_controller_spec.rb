require 'spec_helper'

describe UsersController do
	context "user is signed in"
		let(:user){FactoryGirl.create(:user)}

		before do
			sign_in_as user
			get :index
		end
	it { should redirect_to()
end