class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def current_auth_resource
    if nutritionist_signed_in?
      current_nutritionist
    else
      current_client
    end
  end
  
  def current_ability
    @current_ability = Ability.new(current_auth_resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
