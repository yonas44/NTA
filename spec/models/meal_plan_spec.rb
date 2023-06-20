require 'rails_helper'

RSpec.describe MealPlan do
  let(:user1) { FactoryBot.create(:user, role: "nutritionist")}
  let(:user2) { FactoryBot.create(:user, role: "client")}
  let(:nutritionist) { FactoryBot.create(:nutritionist, user: user1) }
  let(:client) { FactoryBot.create(:client, user: user2) }
  let(:meal_plan) { FactoryBot.create(:meal_plan, nutritionist:, client:) }

  it 'creates a mealPlan record in the database' do
    meal_plan
    expect(described_class.count).to be > 0
  end
end
