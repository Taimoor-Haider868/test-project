# Rails.application.routes.draw do
  # get 'likes/new'
  # get 'likes/create'
  # get 'likes/destroy'
  # get 'users/show'
#   devise_for :users
#   root 'home#index'
#   resources :posts, only: [:index, :new, :create,:show, :edit, :update, :destroy]
#   resources :comments
# end
Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :posts do
    resources :comments, only: [:create,:destroy] # Nested comments resource only for creation
  end
  resources :comments, only: [:destroy] # If you want to allow comment deletion
  resources :users, only: [:show] # Display user profile page


  resources :posts do
    resources :likes, only: [:create, :destroy] 
  end
end
