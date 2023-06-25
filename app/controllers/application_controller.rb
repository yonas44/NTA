class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def current_auth_resource
  #   if nutritionist_signed_in?
  #     current_nutritionist
  #   else
  #     current_client
  #   end
  # end

  # def current_ability
  #   @current_ability = Ability.new(current_auth_resource)
  # end

  rescue_from CanCan::AccessDenied do |_exception|
    render json: { message: 'You are not authorized to perform this action.' }, status: :unauthorized
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role])
  end
end
