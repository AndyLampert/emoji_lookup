Rails.application.routes.draw do
  get 'shared/new'

  resources :posts do
    resources :comments, only: [:index, :new, :create]
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  get 'posts/:id/comments' => 'posts#index'
  get 'posts/:id/comments/new' => 'comments#new'

  # delete 'users/sign_out' => 'sessions#destroy', as: ''
  # get 'users/sign_out' => 'welcome#index'
  root 'welcome#index'
end
