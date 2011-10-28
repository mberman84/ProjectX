class PagesController < ApplicationController
  
  def home
    @title = "Home"
    @upcoming_events = Event.where(:event_date => Time.now..Time.now + 1.week).limit(10).find(:all, :order => "event_date")
    if signed_in?
      @following_users = current_user.followers
      @followed_users = current_user.following
      @event_feed = current_user.event_feed
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end