class SessionsController < ApplicationController
  def new
    @title = "Sign in or Sign up"
    @user = User.new
  end
  
  def create
    #debugger
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
    if user && user.provider.blank?
      user.update_attributes!(:provider => auth["provider"], :uid => auth["uid"])
    elsif user && !user.provider.blank?
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    elsif !user
      user = User.create_with_omniauth(auth)
    end
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"  
  end
  
  def destroy
    sign_out
    #redirect_to root_path
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end