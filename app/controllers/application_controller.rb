class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about], if: :use_before_action?

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def use_before_action?
    true
  end

  protected
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
