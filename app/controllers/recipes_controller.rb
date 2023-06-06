class RecipesController < ApplicationController
  def index
    render json: Recipe.where(nutritionist_id: params[:nutritionist_id])
  end

  def show
    render json: Recipe.find(params[:id])
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      render json: { message: 'Recipe created successfully!' }
    else
      render json: recipe.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    if recipe.update(recipe_params)
      render json: { message: 'Recipe updated successfully!' }
    else
      render json: recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      render json: { message: 'Recipe removed successfully!' }
    else
      render json: recipe.errors, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :picture, :description,
                                   :nutritionist_id, instructions: [],
                                                     recipe_ingredients_attributes: %i[ingredient_id quantity])
  end
end
