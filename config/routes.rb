Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#splash"
  get "/categories", to: "categories#index", as: "categories"
  get "/categories/:category_id", to: "category#show", as: "category"
  
  get '/categories/new', to: 'categories#new', as: 'new_category'
  post '/category', to: 'categories#create', as: 'create_category'

  get '/categories/:category_id/new', to: 'movements#new', as: 'new_movement'
  post '/movement', to: 'movements#create', as: 'create_movement'

end
