Rails.application.routes.draw do
  get 'search/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root 'sessions#home'

  #Users routes
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  resources :categories do
    resources :posts 
  end
  resources :posts do
    resources :comments
  end

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  get '/home', to: 'houses#show'

  get 'search' => 'search#index'
  get 'delete_posts', to: 'users#delete_posts'

end
