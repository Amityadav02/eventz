Rails.application.routes.draw do 

  resources :users
 # resources :registrations

  root "events#index"
  
  resources :events do
    resources :registrations
  end

end
