class PagesController < ApplicationController
  def home
    @title = "Home"
    @events = Event.all.paginate(:page => params[:page])
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