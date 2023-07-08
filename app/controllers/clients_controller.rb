class ClientsController < ApplicationController
  before_action :find_client, except: [:index]
  load_and_authorize_resource

  def index
    render json: current_user.nutritionist.clients.as_json(include: :user), status: 200
  end

  def show
    render json: @client, status: 200
  end

  def update
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
