class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  # load_and_authorize_resource

  def show
    render json: @user.as_json(include: { client: { include: :nutritionist } }), status: 200 if @user.role == 'client'

    return unless @user.role == 'nutritionist'

    render json: @user.as_json(include: { nutritionist: { include: :clients } }),
           status: 200
  end

  def update
    if @user.update(user_params)
      if @user.role == 'nutritionist'
        @user.nutritionist.update(nutritionist_params)
      else
        @user.client.update(client_params)
      end

      render json: { message: 'User info update successfully' }, status: 200
    else
      render json: { message: 'Updating user info failed' }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: { message: 'User removed successfully' }
    else
      render json: { message: 'Failed trying to remove user' }, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def nutritionist_params
    params.require(:user).fetch(:nutritionist, {}).permit(:profile_pic)
  end

  def client_params
    params.require(:user).fetch(:client, {}).permit(:profile_pic, :nutritionist_id)
  end
end
