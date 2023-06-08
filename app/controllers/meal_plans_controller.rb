class MealPlansController < ApplicationController
  before_action :authenticate_the_user

  def index
    if current_nutritionist
      return render json: MealPlan.where(nutritionist_id: current_nutritionist.id) if params[:nutritionist_id]
      
      render json: MealPlan.where(client_id: params[:client_id].to_i)
    else
      render json: MealPlan.where(client_id: current_client.id)
    end
  end

  def show
    render json: MealPlan.find(params[:id])
  end

  private

  def authenticate_the_user
    if current_client
      if current_client.id != params[:client_id].to_i
        authenticate_client!
      end
    elsif current_nutritionist
      if current_nutritionist.id != params[:nutritionist_id].to_i
        authenticate_nutritionist!
      end
    else
      render json: { message: "You are not authentcated" }, status: 401
    end
  end
end
