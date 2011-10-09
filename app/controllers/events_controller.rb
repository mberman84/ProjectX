class EventsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user, :only => [:destroy, :update, :update]
  
  def index
    @title = "All events"
    @events = Event.order('event_date ASC').all.paginate(:page => params[:page])
  end
  
  def show
    @event = Event.find(params[:id])
    @attendees = @event.users
    @current_user = current_user
    @title = @event.name
  end
  
  def attend
    session[:return_to] = request.referrer
    @event = Event.find(params[:id])
    if @event.users.include?(current_user)
      flash[:error] = "You're already attending this event."
    else
      current_user.events << @event
      flash[:success] = "Attending event!"
    end
    redirect_to session[:return_to]
  end
  
  def remove_attendee
    session[:return_to] = request.referrer
    @event = Event.find(params[:id])
    @event.remove_attendance(params[:user_id])
    flash[:success] = "User removed from event."
    redirect_to session[:return_to]
  end
  
  def new
    @event = Event.new
    @title = "New Events"
  end
  
  def create
    @event = Event.new(params[:event])
    @event.event_date = Chronic.parse(params[:event_date])
    @event.owner_id = current_user.id
    if @event.save
      flash[:success] = "Event created!"
      redirect_to events_path
    else
      redirect_to events_path
    end
  end  
  
  def edit
    @event = Event.find(params[:id])
    @title = "Edit event"
  end
  
  def update
    @event = Event.find(params[:id])
    @event.event_date = Chronic.parse(params[:event_date])
    if @event.update_attributes(params[:event])
      flash[:success] = "Event updated."
      redirect_to @event
    else
      @title = "Edit event"
      render 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Event destroyed."
    redirect_to events_path
  end
  
  private
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def authenticate
      deny_access unless signed_in?
    end
end