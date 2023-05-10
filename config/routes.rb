Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index]
  post '/login', to: 'users#login'
  # Defines the root path route ("/")
  # root "articles#index"
end
