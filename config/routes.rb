Rails.application.routes.draw do
  resources :posts
  devise_for :users, except: :destroy

  # get 'users/sign_out' => 'sessions#destroy', :as => :destroy_user_session
  # get 'users/sign_out' => 'welcome#index'
  root 'welcome#index'
end
