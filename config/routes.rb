Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  #get '/tweets', to: 'tweets#index'
  resources :tweets
  resources :relationships, only: [:create, :destroy]
  get 'followers', to: 'relationships#followers'
  get 'following', to: 'relationships#show'


  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index, :show, :create, :destroy]
      post 'sign_up/', to: 'users#create'
      post 'sign_in/', to: 'users#login'
    end
  end




end
