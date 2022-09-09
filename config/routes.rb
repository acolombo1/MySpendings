Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  get '/user' => "categories#index", :as => :user_root

  # Defines the root path route ("/")
  root "users#splash"
  
  get '/categories/new', to: 'categories#new', as: 'new_category'
  post '/category', to: 'categories#create', as: 'create_category'

  get "/categories", to: "categories#index", as: "categories"
  get "/categories/:category_id", to: "categories#show", as: "category"
  
  get '/categories/:category_id/new', to: 'movements#new', as: 'new_movement'
  post '/movement', to: 'movements#create', as: 'create_movement'

end
