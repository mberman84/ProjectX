ActiveAdmin.register Event do
  index do
    column :id
    column :name, :sortable => :name do |event|
      link_to event.name, admin_event_path(event)
    end
    column :owner_id, :sortable => :owner_id do |event|
      event.owner_name
    end
    column :location
    column "Created Date", :created_at
    column :event_date
    column :description
    default_actions
  end
  
  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :description
      f.input :event_date, :prompt => {:day => 'day', 
                                       :month => 'month', 
                                       :year => 'year',
                                       :hour => 'hour',
                                       :minute => 'minute'}
      f.input :owner_id, :label => "Owner ID", :input_html => { :value => "1" }
      f.input :location
    end
    f.buttons
  end
end
