Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users

  get 'posts/:id/comments' => 'posts#index'

  # delete 'users/sign_out' => 'sessions#destroy', as: ''
  # get 'users/sign_out' => 'welcome#index'
  root 'welcome#index'
end
