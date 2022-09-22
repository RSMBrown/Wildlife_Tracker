Rails.application.routes.draw do
  root "animals#index"
  resources :animals
  resources :sightings
  resources :regions 
  get "/search_region", to: "regions#search_region"
  get "/search_date", to: "sightings#search_date"
end
