Findingaids::Application.routes.draw do
  
  root :to => "catalog#index"

  Blacklight.add_routes(self)

  match 'login', :to => 'user_sessions#new', :as => :login
  match 'logout', :to => 'user_sessions#destroy', :as => :logout
  match 'validate', :to => 'user_sessions#validate', :as => :validate
  resources :user_sessions
  
end
