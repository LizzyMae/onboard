Rails.application.routes.draw do

  #we want to add the abilitie ti create update delete and view rooms
  resources :rooms

  #signup
  resources :users

  #log in and log out
  #singular resource coz we only want to do this once
  resource :session


  #home page this the list of rooms
  root "rooms#index"

end
