require 'rails_helper'

RSpec.describe MealType, type: :model do
  before(:all) {
    FactoryBot.create(:meal_type)
  }

  it 'returns a meal_type from database' do
    expect(described_class.count).to be > 0
  end
    
end
