require 'rails_helper'

RSpec.describe MealPlan do
  let(:nutritionist) { create(:nutritionist) }
  let(:client) { create(:client) }
  let(:meal_plan) { create(:meal_plan, nutritionist:, client:) }

  it 'creates a mealPlan record in the database' do
    meal_plan
    expect(described_class.count).to be > 0
  end
end
