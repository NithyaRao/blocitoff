Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
     resources :items, only: [:create, :destroy]
  end
  namespace :api, defaults: { format: :json } do
     resources :users do
        resources :items, only: [:create]
     end
     
     resources :items, only: [:destroy]
   end
  root to: 'welcome#index'
end
