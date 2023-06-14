require 'rails_helper'

RSpec.describe MealType, type: :model do
  before(:all) do
    FactoryBot.create(:meal_type)
  end

  it 'returns a meal_type from database' do
    expect(described_class.count).to be > 0
  end
end
