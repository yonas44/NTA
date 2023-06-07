require 'rails_helper'

RSpec.describe MealPlanRecipe do
  let(:nutritionist) { FactoryBot.create(:nutritionist) }
  let(:client) { FactoryBot.create(:client) }
  let(:meal_plan) { FactoryBot.create(:meal_plan, client:, nutritionist:) }
  let(:recipe) { FactoryBot.create(:recipe, nutritionist:) }
  let(:meal_plan_recipe) { FactoryBot.create(:meal_plan_recipe, meal_plan:, recipe:) }

  it 'creates a record of meal_plan_recipe' do
    meal_plan_recipe
    expect(described_class.count).to be > 0
  end
end
