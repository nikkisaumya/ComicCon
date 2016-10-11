Rails.application.routes.draw do
  
  devise_for :users
  resources :posts do 
  	member do
  		put 'like', to: 'posts#upvote'
  	end
    resources :comments
  end 
  resources :users, only: [:show]
  resources :profile
  resources :friendship, only: [:destroy]
  get 'my_friends', to: "users#my_friends"
  get 'search_friends', to: "users#search"
  post 'add_friend', to: "users#add_friend"
  

  root "posts#profile"
  #root "profile#index"
end
