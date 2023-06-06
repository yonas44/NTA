class IngredientsController < ApplicationController
  def index
    render json: Ingredient.where(nutritionist_id: params[:nutritionist_id])
  end

  def show
    render json: Ingredient.find(params[:id])
  end

  def create
    ingredient = Ingredient.create(ingredient_params)
    if ingredient.save
      render json: { message: 'Ingredient created successfully!' }
    else
      render json: ingredient.errors, status: :unprocessable_entity
    end
  end

  def update
    ingredient = Ingredient.find(params[:id])
    if ingredient.update(ingredient_params)
      render json: { message: 'Ingredient updated successfully!' }
    else
      render json: ingredient.errors, status: :unprocessable_entity
    end
  end

  def destroy
    ingredient = Ingredient.find(params[:id])
    if ingredient.destroy
      render json: { message: 'Ingredient deleted successfully!' }
    else
      render json: ingredient.errors, status: :unprocessable_entity
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :picture).merge(nutritionist_id: params[:nutritionist_id].to_i)
  end
end
