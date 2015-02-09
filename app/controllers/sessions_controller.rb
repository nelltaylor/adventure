class SessionsController < ApplicationController
  # respond_to :html, :js
  skip_before_action :verify_authenticity_token


  def new
    render partial: 'new'
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      render :js => "window.location = '/'"
    else
      flash.now.alert = "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
