class PagesController < ApplicationController
  def home
    @title = "Home"
    @events = Event.all.paginate(:page => params[:page])
    @upcoming_events = Event.where(:event_date => Time.now..Time.now + 1.week).limit(10)
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