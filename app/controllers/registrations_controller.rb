class RegistrationsController < Devise::RegistrationsController

  def edit
    @posts = Post.all
  end

  protected

  def after_sign_up_path_for(resource)
    '/' # Or :prefix_to_your_route
  end
end