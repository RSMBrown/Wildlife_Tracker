Rails.application.routes.draw do
  root "animals#index"
  resources :animals
  resources :sightings
  resources :regions 
  get "/search_region", to: "regions#search_region"
  get "/new_search", to: "sightings#new_search"
  get "/search_date", to: "sightings#search_date"

  get '/regions/:id/new_sightings', to: 'regions#new_sighting', as: "region_new_sighting"
  post '/regions/:id/sightings', to: 'regions#create_sighting', as: "region_create_sighting"

  get '/animals/:id/new_sightings', to: 'animals#new_sighting', as: "animal_new_sighting"
  post '/animals/:id/sightings', to: 'animals#create_sighting', as: "animal_create_sighting"
end
