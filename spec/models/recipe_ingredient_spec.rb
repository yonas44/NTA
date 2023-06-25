require 'rails_helper'

RSpec.describe RecipeIngredient do
  let(:user) { FactoryBot.create(:user, role: 'nutritionist') }
  let(:nutritionist) { FactoryBot.create(:nutritionist, user:) }
  let(:ingredient) { FactoryBot.create(:ingredient, nutritionist:) }
  let(:recipe) { FactoryBot.create(:recipe, nutritionist:) }
  let(:recipe_ingredient) { FactoryBot.create(:recipe_ingredient, ingredient:, recipe:) }

  it 'creates a record of meal_plan_recipe' do
    recipe_ingredient
    expect(described_class.count).to be > 0
  end
end
