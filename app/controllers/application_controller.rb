class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(_resource)
    users_path
  end

  def after_sign_up_path_for(_resource)
    user_index_path
  end
end
