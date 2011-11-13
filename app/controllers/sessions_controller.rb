class SessionsController < ApplicationController
  def new
    @title = "Sign in or Sign up"
    @user = User.new
  end
  
  def create
    #user = User.authenticate(params[:session][:email],
    #                         params[:session][:password])
    #if user.nil?
    #  flash.now[:error] = "Invalid email/password combination."
    #  @title = "Sign in"
    #  render 'new'
    #else
    #  sign_in user
    #  redirect_back_or events_path
    #end    
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"                      
  end
  
  def destroy
    #sign_out
    #redirect_to root_path
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end