class MealPlansController < ApplicationController
  before_action :authenticate_the_user
  before_action :find_meal_plan, except: %w[index create]

  def index
    if current_nutritionist
      if params[:nutritionist_id]
        return render json: MealPlan.includes(recipes: :ingredients).where(nutritionist_id: current_nutritionist.id)
      end

      render json: MealPlan.includes(recipes: :ingredients).where(client_id: params[:client_id].to_i)
    else
      render json: MealPlan.includes(recipes: :ingredients).where(client_id: current_client.id)
    end
  end

  def show
    render json: @meal_plan
  end

  def create
    meal_plan = MealPlan.new(meal_plan_params)
    if meal_plan.save
      render json: { message: 'Meal_plan created successfully' }, status: 200
    else
      render json: { message: meal_plan&.errors&.full_messages || 'Failed creating meal_plan' },
             status: :unprocessable_entity
    end
  end

  def update
    if @meal_plan.update(meal_plan_params)
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
    params.require(:meal_plan).permit(:title, :nutritionist_id, :client_id, :description,
                                      meal_plan_recipes_attributes: %i[recipe_id portion_size])
  end

  def authenticate_the_user
    if current_client
      authenticate_client! if current_client.id != params[:client_id].to_i
    elsif current_nutritionist
      authenticate_nutritionist! if current_nutritionist.id != params[:nutritionist_id].to_i
    else
      render json: { message: 'You are not authentcated' }, status: 401
    end
  end
end
