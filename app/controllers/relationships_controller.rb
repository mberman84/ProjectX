class RelationshipsController < ApplicationController
  before_filter :authenticate
  
  def create
    session[:return_to] = request.referrer
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html { redirect_to session[:return_to] }
      format.js
    end
  end
  
  def destroy
    session[:return_to] = request.referrer
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to session[:return_to] }
      format.js
    end
  end
end