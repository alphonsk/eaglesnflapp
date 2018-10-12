Rails.application.routes.draw do
  root 'teams#index'
  

  resources :teams do
    post 'posts', to: 'posts#create'
    # resources :comments, only: [:create]
  end

  resources :comments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

