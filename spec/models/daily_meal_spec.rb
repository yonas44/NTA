require 'rails_helper'

RSpec.describe DailyMeal, type: :model do
  before(:all) do
    user = FactoryBot.create(:user, role: 'nutritionist')
    user2 = FactoryBot.create(:user, role: 'client')
    @nutritionist = FactoryBot.create(:nutritionist, user:)
    @client = FactoryBot.create(:client, user: user2)
    @recipe = FactoryBot.create(:recipe, nutritionist_id: @nutritionist.id)
    @meal_plan = FactoryBot.create(:meal_plan, client_id: @client.id, nutritionist_id: @nutritionist.id)
    @meal_type = FactoryBot.create(:meal_type)
    FactoryBot.create(:daily_meal, nutritionist_id: @nutritionist.id, recipe_id: @recipe.id,
                                   meal_plan_id: @meal_plan.id, meal_type_id: @meal_type.id)
  end

  it 'returns a record of a dail_meal' do
    expect(described_class.count).to be > 0
  end
end
