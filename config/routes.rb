Rails.application.routes.draw do
  
  root 'posts#index'
  
  # Add a user show page
  # get 'users/:id'
  # get 'users/index'
  # get '/user/:id' => "users#show:id"
  devise_for :users

  resources :users, only: [:show, :index ]

  resources :teams do
    post 'posts', to: 'posts#create'
    post  'userteams', to: 'userteams#create'
    # comment 'comments', to: 'comments#create'
    # resources :comments, only: [:create]
    collection {post :import }
    get "myteams/destroy"
  end

  resources :comments
  resources :posts
  resources :userteams
  # devise_for :users, controllers: { sessions: 'users/sessions' }

    
  get "/myteams" => "teams#myteams"
  get "/teams/myteams" => "teams#myteams"
  post  '/', to: 'userteams#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'users/index'
  # get 'users/:id'
  # get 'userteams/index'
  # get 'userteams/new'
  # get 'userteams/destroy'
end

 
 
