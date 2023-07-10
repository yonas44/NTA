class MealPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :find_meal_plan, except: %w[index create]
  load_and_authorize_resource except: [:create]

  def index
    if current_user.role == 'nutritionist' || current_user.role == 'admin'
      return render json: MealPlan.where(nutritionist_id: current_user.nutritionist.id)
                            .as_json(include: { client: { include: { user: { only: :name } } } })
    end

    render json: MealPlan.where(client_id: current_user.client.id).as_json(include: :nutritionist)
  end

  def show
    render json: @meal_plan.as_json(include: :daily_meals)
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
    params.require(:meal_plan).permit(:title, :client_id, :start_date,
                                      :end_date).merge(nutritionist_id: current_user.nutritionist.id)
  end

  def update_meal_plan_params
    params.require(:meal_plan).permit(:title, :start_date, :end_date)
  end
end
