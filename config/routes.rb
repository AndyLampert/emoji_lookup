Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts do
    resources :comments, only: [:index, :new, :create] do

    # TODO which one of the below does this generate?
    # get 'posts/:post_id/comments/:comment_id/vote_up' => 'comments#vote_comment_up'
    # get 'posts/:id/comments/:id/vote_up' => 'comments#vote_comment_up'
      member do
        get 'vote_up' => 'comments#vote_comment_up'
        get 'vote_down' => 'comments#vote_comment_down'
      end
    end
  end

  root 'welcome#index'
end

# No route matches {:action=>"vote_comment_up", :controller=>"comments", :id=>nil, :post_id=>#<Comment id: 1, post_id: 1, body: "yoooo", user_id: 2, created_at: "2015-08-14 21:50:37", updated_at: "2015-08-14 21:50:37", vote_count: nil>} missing required keys: [:id]
