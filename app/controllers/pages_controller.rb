class PagesController < ApplicationController
  
  def home
    @title = "Home"
    #@upcoming_events = Event.where(:event_date => Time.now..Time.now + 1.week).limit(10).find(:all, :order => "event_date")
    @json = Event.all.to_gmaps4rails
    if signed_in?
      @event_feed = current_user.event_feed
      @past_events = @event_feed.where("event_date < ?", Time.now)
                                .limit(3)
                                .find(:all, :order => "event_date DESC")
      @upcoming_events = @event_feed.where("event_date >= ?", Time.now)
                                    .limit(3)
                                    .find(:all, :order => "event_date")
    else
      @past_events = Event.where("event_date < ?", Time.now)
                          .limit(3)
                          .find(:all, :order => "event_date DESC")
      @upcoming_events = Event.where("event_date >= ?", Time.now)
                              .limit(3)
                              .find(:all, :order => "event_date DESC")
      
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