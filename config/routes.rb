Rails.application.routes.draw do
  root 'teams#index'
  

  resources :teams do
    post 'posts', to: 'posts#create'
    # comment 'comments', to: 'comments#create'
    # resources :comments, only: [:create]
    collection {post :import }
    get "myteams/destroy"
  end

  resources :comments
  devise_for :users

    
  get "/myteams" => "teams#myteams"
  get "/teams/myteams" => "teams#myteams"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

