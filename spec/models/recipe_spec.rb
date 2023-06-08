require 'rails_helper'

RSpec.describe Recipe do
  let(:nutritionist) { FactoryBot.create(:nutritionist) }
  let(:recipe) { FactoryBot.create(:recipe, nutritionist:) }

  it 'creates a mealPlan record in the database' do
    recipe
    expect(described_class.count).to be > 0
  end
end
