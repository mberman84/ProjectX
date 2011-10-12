class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  before_filter :set_user_time_zone

  private

  def set_user_time_zone
    Time.zone = current_user.time_zone if is_signed_in?
  end
end
