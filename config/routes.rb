Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/api/logout', to: "authentication#logout"
  post '/api/login', to: 'authentication#login'
  post '/api/register', to: 'authentication#register'
  # get '/api/cities', to: 'locations#index'


  namespace :api do
    namespace :v1 do
      resources :reservations, only: %i[index show create destroy]
      resources :ebikes, only: %i[index show create destroy]
      resources :locations, only: %i[index ]
      resources :ebike_models, only: %i[index ]
    end
  end


end