# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(sign_up_params)

    if user.save
      if user.role == 'nutritionist'
        FactoryBot.create(:nutritionist, user: )
      else
        FactoryBot.create(:client, user: )
      end
      
      yield user if block_given?
      render json: { message: 'Signed up successfully.' }
    else
      clean_up_passwords resource
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
