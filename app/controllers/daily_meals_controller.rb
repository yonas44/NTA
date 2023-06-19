class DailyMealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_daily_meal, only: %w[show update destroy]
  load_and_authorize_resource

  def index
    if current_user.role == 'client'
      render json: DailyMeal.where(nutritionist_id: current_user.client.nutritionist_id).as_json(include: :recipe)
    else
      render json: DailyMeal.where(nutritionist_id: current_user.nutritionist.id).as_json(include: :recipe)
    end
  end

  def create
    daily_meal = DailyMeal.new(daily_meal_params)
    if daily_meal.save
      render json: { message: 'Daily_meal created successfully' }, status: 200
    else
      render json: { message: daily_meal.errors.full_messages || 'Daily_meal failed to create' }, status: :unprocessable_entity
    end
  end

  def update
    if @daily_meal.update(daily_meal_params)
      render json: { message: 'Daily_meal updated successfully' }
    else
      render json: { message: @daily_meal.errors.full_messages || 'Daily_meal update failed' }, status: :unprocessable_entity
    end
  end

  def destroy
    if @daily_meal.destroy
      render json: { message: 'Daily_meal removed successfully' }
    else
      render json: { message: 'Daily_meal remove failed' }, status: :unprocessable_entity
    end
  end

  private

  def set_daily_meal
    @daily_meal = DailyMeal.find(params[:id])
  end

  def daily_meal_params
    params.require(:daily_meal).permit(:recipe_id, :meal_plan_id, :meal_type_id, :meal_date).merge(
      nutritionist_id: current_user.nutritionist.id)
  end
end
