Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users

  # delete 'users/sign_out' => 'sessions#destroy', as: ''
  # get 'users/sign_out' => 'welcome#index'
  root 'welcome#index'
end
