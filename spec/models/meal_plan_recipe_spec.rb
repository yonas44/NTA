require 'rails_helper'

RSpec.describe MealPlanRecipe do
  let(:nutritionist) { create(:nutritionist) }
  let(:client) { create(:client) }
  let(:meal_plan) { create(:meal_plan, client:, nutritionist:) }
  let(:recipe) { create(:recipe, nutritionist:) }
  let(:meal_plan_recipe) { create(:meal_plan_recipe, meal_plan:, recipe:) }

  it 'creates a record of meal_plan_recipe' do
    meal_plan_recipe
    expect(described_class.count).to be > 0
  end
end
