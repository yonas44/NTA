require 'rails_helper'

RSpec.describe MealPlan do
  let(:nutritionist) { FactoryBot.create(:nutritionist) }
  let(:client) { FactoryBot.create(:client) }
  let(:meal_plan) { FactoryBot.create(:meal_plan, nutritionist:, client:) }

  it 'creates a mealPlan record in the database' do
    meal_plan
    expect(described_class.count).to be > 0
  end
end
