class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_recipe, only: %w[show update destroy]
  load_and_authorize_resource

  def index
    render json: Recipe.where(nutritionist_id: current_user.nutritionist.id).as_json(include: :ingredients)
  end

  def show
    render json: @recipe.as_json(include: :recipe_ingredients)
  end

  def create
    recipe = Recipe.new(recipe_params.merge(recipe_ingredient_params))
    recipe.nutritionist = current_user.nutritionist

    if recipe.save
      render json: { message: 'Recipe created successfully!' }
    else
      render json: recipe.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)

      recipe_ingredient_params[:recipe_ingredients_attributes]&.each do |attributes|
        recipe_ingredient = @recipe.recipe_ingredients.find_by(ingredient_id: attributes[:ingredient_id])
        if recipe_ingredient.present?
          recipe_ingredient.update(attributes)
        else
          @recipe.recipe_ingredients.create(attributes)
        end
      end

      recipe_ingredient_params[:revoked_recipe_ingredients]&.each do |attributes|
        @recipe.recipe_ingredients.find_by(ingredient_id: attributes[:ingredient_id]).destroy
      end

      render json: { message: 'Recipe updated successfully!' }
    else
      render json: @recipe.errors, status: :unprocessable_entity
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
    if params[:recipe][:picture] == 'undefined'
      params.require(:recipe).permit(:title, :description, :isPublic,
                                     instructions: [])
    else
      params.require(:recipe).permit(:title, :picture, :description, :isPublic,
                                     instructions: [])
    end
  end

  def recipe_ingredient_params
    params.require(:recipe).permit(recipe_ingredients_attributes: %i[ingredient_id quantity],
                                   revoked_recipe_ingredients: %i[ingredient_id
                                                                  quantity])
  end
end
