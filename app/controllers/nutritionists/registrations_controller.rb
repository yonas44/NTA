module Nutritionists
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters
    respond_to :json

    def create
      build_resource(sign_up_params)

      if resource.save
        yield resource if block_given?
        render json: { message: 'Signed up successfully.' }
      else
        clean_up_passwords resource
        render json: { errors: resource.errors.full_messages[0] }, status: :unprocessable_entity
      end
    end

    private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
  end
end
