Rails.application.routes.draw do

  #we want to add the abilitie ti create update delete and view rooms
  resources :rooms

  #home page this the list of rooms
  root "rooms#index"

end
