class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_ingredient, only: %w[show update destroy]
  load_and_authorize_resource

  def index
    render json: Ingredient.where(nutritionist_id: current_user.nutritionist.id)
  end

  def show
    render json: @ingredient
  end

  def create
    ingredient = Ingredient.new(ingredient_params)
    ingredient.nutritionist_id = current_user.nutritionist.id

    if ingredient.save
      render json: { message: 'Ingredient created successfully!' }
    else
      render json: { errors: ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      render json: { message: 'Ingredient updated successfully!' }
    else
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @ingredient.destroy
      render json: { message: 'Ingredient deleted successfully!' }
    else
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    if params[:ingredient][:picture] != 'undefined'
      params.require(:ingredient).permit(:name, :category, :picture, :macro_nutrients)
    else
      params.require(:ingredient).permit(:name, :category, :macro_nutrients)
    end
  end
end
