Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'users/sign_out', to: "users#user_sign_out", as: "user_sign_out"
  post '/api/login', to: 'authentication#login'
  post '/api/register', to: 'authentication#register'

  
  namespace :api do
    namespace :v1 do
      resources :reservations, only: %i[index show create destroy]
      resources :ebikes, only: %i[index show create destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :reservations, only: %i[index show create destroy]
      resources :ebikes, only: %i[index show create destroy]
    end
  end


end