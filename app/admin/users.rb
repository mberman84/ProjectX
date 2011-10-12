ActiveAdmin.register User do  
  index do
    column :id
    column :name, :sortable => :name do |user|
      link_to user.name, admin_user_path(user)
    end
    column :email
    column :admin
    column :time_zone
    column :location
    default_actions
  end
  
  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :admin
      f.input :time_zone
      f.input :location
    end
    f.buttons
  end
end