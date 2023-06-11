class RecipesController < ApplicationController
  before_action :find_recipe, only: %w[show update destroy]

  def index
    render json: Recipe.as_json(include: :ingredients).where(nutritionist_id: params[:nutritionist_id])
  end

  def show
    render json: @recipe
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
    if @recipe.update(recipe_params)
      render json: { message: 'Recipe updated successfully!' }
    else
      render json: recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @recipe.destroy
      render json: { message: 'Recipe removed successfully!' }
    else
      render json: recipe.errors, status: :unprocessable_entity
    end
  end

  private

  def find_recipe
    @recipe = Recipe.includes(:ingredients).find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :picture, :description,
                                   :nutritionist_id, instructions: [],
                                                     recipe_ingredients_attributes: %i[ingredient_id quantity])
  end
end
