class SessionsController < ApplicationController
  def new
    @title = "Sign in or Sign up"
    @user = User.new
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_back_or events_path
    end                    
  end
  
  def create_with_omni                     
    auth = request.env["omniauth.auth"]
    user = User.find_by_email(auth["info"]["email"])
    #user has an account but hasn't authenticated with any service
    if user && user.provider.blank?
      user.pwsave = false
      user.update_attributes!(:provider => auth["provider"], 
                              :uid      => auth["uid"],
                              :location => auth["info"]["location"],
                              :fbimg    => auth["info"]["image"])
    elsif user && !user.provider.blank?
      user.pwsave = false
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    elsif !user
      user = User.create_with_omniauth(auth)
    end
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"  
  end
  
  def destroy
    sign_out
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end