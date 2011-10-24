class Event < ActiveRecord::Base
  attr_accessible :name, 
                  :description, 
                  :event_date, 
                  :location, 
                  :owner_id, 
                  :photo
  
  has_and_belongs_to_many :users
  
  has_attached_file :photo, :styles => { :small => "150x150>",
                                         :medium => "400x400>",
                                         :large => "600x600>"},
                    :url  => "/assets/events/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 
                                                              'image/png', 
                                                              'image/jpg']
  
  validates :name, :presence => true,
                   :length => { :maximum => 50 }
                   
  validates :description, :presence => true,
                          :length => { :maximum => 50 }
  
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
