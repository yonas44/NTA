class MealPlansController < ApplicationController
  before_action :authenticate_nutritionist!, except: %w[index]
  before_action :find_meal_plan, except: %w[index create]
  load_and_authorize_resource except: %w[create update]

  def index
    if current_nutritionist || current_client
      return render json: MealPlan.where(nutritionist_id: params[:nutritionist_id]) if current_nutritionist
      
      render json: MealPlan.where(client_id: params[:client_id]) if current_client
    else
      render json: { message: "You are not authorized" }, status: 401
    end
  end
  
  def show
    render json: @meal_plan
  end
  
  def create
    meal_plan = MealPlan.new(meal_plan_params)
    authorize! :create, meal_plan, client_id: params[:meal_plan][:client_id]
    
    if meal_plan.save
      render json: { message: 'Meal_plan created successfully' }, status: 200
    else
      render json: { message: meal_plan&.errors&.full_messages || 'Failed creating meal_plan' },
      status: :unprocessable_entity
    end
  end
  
  def update
    if @meal_plan.update(update_meal_plan_params)
      render json: { message: 'Meal_plan updated successfully' }, status: 200
    else
      render json: { message: @meal_plan&.errors&.full_messages || 'Failed updating meal_plan' },
      status: :unprocessable_entity
    end
  end

  def destroy
    if @meal_plan.destroy
      render json: { message: 'Meal_plan removed successfully' }, status: 200
    else
      render json: { message: @meal_plan&.errors&.full_messages || 'Failed removing the meal_plan' },
      status: :unprocessable_entity
    end
  end
  
  private
 
  def find_meal_plan
    @meal_plan = MealPlan.find(params[:id])
  end
  
  def meal_plan_params
    params.require(:meal_plan).permit(:title, :client_id, :start_date, :end_date).merge(nutritionist_id: params[:nutritionist_id])
  end
  
  def update_meal_plan_params
    params.require(:meal_plan).permit(:title, :start_date, :end_date)
  end
end
