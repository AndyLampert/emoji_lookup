class WelcomeController < ApplicationController
  def index
    @user = current_user
    @last_five_posts = Post.last(5)

  end
end