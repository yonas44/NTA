class ClientsController < ApplicationController
  before_action :find_client
  before_action :authenticate_client!
  # before_action :authenticate_user

  def show
    render json: @client, status: 200
  end

  def update
    return render json: { message: 'Not a valid client' } unless current_client.id == params[:id].to_i

    if current_client.update(client_params)
      render json: { message: 'Client info update successfully' }, status: 200
    else
      render json: { message: 'Updating client info failed' }, status: :unprocessable_entity
    end
  end

  private

  def find_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :email, :password)
  end
end
