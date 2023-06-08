class IngredientsController < ApplicationController
  before_action :authenticate_nutritionist!
  before_action :find_ingredient, only: %w[show update destroy]

  def index
    render json: Ingredient.where(nutritionist_id: params[:nutritionist_id])
  end

  def show
    render json: @ingredient
  end

  def create
    ingredient = Ingredient.create(ingredient_params)
    if ingredient.save
      render json: { message: 'Ingredient created successfully!' }
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      render json: { message: 'Ingredient updated successfully!' }
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @ingredient.destroy
      render json: { message: 'Ingredient deleted successfully!' }
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :picture).merge(nutritionist_id: params[:nutritionist_id].to_i)
  end
end
