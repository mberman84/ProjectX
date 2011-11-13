class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include SessionsHelper
  
  helper_method :current_user
  
  before_filter :set_user_time_zone

  private

  def set_user_time_zone
    Time.zone = current_user.time_zone if signed_in?
  end
  
  def index
    @events = Event.search(params[:search]).limit(5)
  end
  
  #def current_user
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
end