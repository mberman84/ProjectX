class Event < ActiveRecord::Base
  attr_accessible :name, :description, :event_date, :location
  
  has_and_belongs_to_many :users
  
  def remove_attendance(user_id)
    users.delete(User.find(user_id))
  end
  
  def formatted_date
    formatted_date = event_date.strftime("%m/%d/%Y at %I:%M%p") unless event_date.nil?
    formatted_date
  end
  
  def is_owner?(user_id)
    user_id == owner_id
  end
  
  def owner_name
    owner_name = User.find(owner_id)
    owner_name.name
  end
end
