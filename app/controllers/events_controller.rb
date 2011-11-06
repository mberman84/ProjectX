class EventsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  before_filter :authenticate, :only => [:my_events,
                                         :attend,
                                         :edit,
                                         :remove_attendee]
  before_filter :is_owner, :only => [:destroy, 
                                     :update,
                                     :edit]
  
  def index
    @title = "All events"
    if params[:list_by] == "event_feed"
      @events = @current_user.event_feed
                             .where("event_date >= ?", Time.now)
                             .limit(5)
                             .order(sort_column + " " + sort_direction)
                             .find(:all, :order => "event_date DESC")
      @json = @events.to_gmaps4rails
    elsif params[:list_by] == "owned_events"
      @events = Event.where(:owner_id => @current_user.id)
                     .limit(5)
                     .order(sort_column + " " + sort_direction)
                     .find(:all, :order => "event_date DESC")
      @json = @events.to_gmaps4rails
    else
      @events = Event.search(params[:search])
                     .where("event_date >= ?", Time.now)
                     .limit(5)
                     .order(sort_column + " " + sort_direction)
                     .find(:all, :order => "event_date DESC")
      @json = @events.to_gmaps4rails
    end
  end
  
  def show
    @event = Event.find(params[:id])
    @attendees = @event.users
    @current_user = current_user
    @title = @event.name
    @json = Event.find(params[:id]).to_gmaps4rails
  end
  
  def my_events
    @my_events = current_user.events(:all).order('event_date ASC')
    @title = "My events"
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
    if @event.remove_attendance(current_user.id)
      flash[:success] = "User removed from event."
    else
      flash[:error] = "Could not remove user"
    end
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
    current_user.events << @event
    if @event.save
      flash[:success] = "Event created!"
      redirect_to events_path
    else
      flash[:failure] = "Not saved correctly."
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
    @event.category = params[:category]
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

    def sort_column
      Event.column_names.include?(params[:sort]) ? params[:sort] : "event_date"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def is_owner
      @event = Event.find(params[:id])
      redirect_to(root_path) unless (@event.owner_id == current_user.id)
    end
    
    def authenticate
      deny_access unless signed_in?
    end
end