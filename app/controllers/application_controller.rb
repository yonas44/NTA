class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :skip_authentication?

  private

  def authenticate_user!
    respond_to_unauthorized unless current_user
  end

  def respond_to_unauthorized
    render json: { error: 'You are not authorized, try logging in.' }, status: :unauthorized
  end

  rescue_from CanCan::AccessDenied do |_exception|
    render json: { message: 'You are not authorized to perform this action.' }, status: :unauthorized
  end

  def skip_authentication?
    controller_name == 'registrations' && action_name == 'create'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role])
  end
end
