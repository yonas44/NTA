require 'rails_helper'

RSpec.describe RecipeIngredient do
  let(:nutritionist) { create(:nutritionist) }
  let(:ingredient) { create(:ingredient, nutritionist:) }
  let(:recipe) { create(:recipe, nutritionist:) }
  let(:recipe_ingredient) { create(:recipe_ingredient, ingredient:, recipe:) }

  it 'creates a record of meal_plan_recipe' do
    recipe_ingredient
    expect(described_class.count).to be > 0
  end
end
