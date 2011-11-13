SampleApp::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  resources :events do
    member do
      post :attend
      post "/remove_attendee/:user_id" => "events#remove_attendee", :as=>:remove_attendee
      post "/edit" => "events#edit"
    end
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  match '/signup', :to => 'sessions#new'
  match '/create_event', :to => 'events#new'
  match '/my_events', :to => 'events#my_events'
  match '/signin', :to => 'sessions#new'
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/help', :to => 'pages#help'
  match "/auth/:provider/callback" => "sessions#create_with_omni"
  match "/signout" => "sessions#destroy", :as => :signout
  
  root :to => 'events#index'
  

end