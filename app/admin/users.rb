ActiveAdmin.register User do
  index do
    column :id
    column :name, :sortable => :name do |user|
      link_to user.name, admin_user_path(user)
    end
    column :email
    column :time_zone
    default_actions
  end
  
end
