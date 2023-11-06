Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'users/sign_out', to: "users#user_sign_out", as: "user_sign_out"


  resources :users, only: %i[index]
  resources :reservations, only: %i[index]
  resources :ebikes, only: %i[index]

  namespace :api do
    namespace :v1 do
      resources :reservations, only: %i[index show create destroy]
      resources :ebikes, only: %i[index show create destroy]
    end
  end

end
