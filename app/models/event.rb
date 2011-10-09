class Event < ActiveRecord::Base
  attr_accessible :name, :description, :event_date, :location, :formatted_Date
  
  has_and_belongs_to_many :users
  # belongs_to :user, 
  
  def remove_attendance(user_id)
    users.delete(User.find(user_id))
  end
    
end
