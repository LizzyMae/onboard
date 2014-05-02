Rails.application.routes.draw do

  # we want to put in a specific url
  get "about" => "contents#show"
  get "auth/:provider/callback" => "social_logins#create"

  #we want to add the abilitie ti create update delete and view rooms
  resources :rooms do
  	#becuase orders are always on rooms we nest the resources
  	resources :orders
  end

  #signup
  resources :users

  #log in and log out
  #singular resource coz we only want to do this once
  resource :session


  #home page this the list of rooms
  root "rooms#index"

end
