require 'rails_helper'

RSpec.describe Recipe do
  let(:nutritionist) { create(:nutritionist) }
  let(:recipe) { create(:recipe, nutritionist:) }

  it 'creates a mealPlan record in the database' do
    recipe
    expect(described_class.count).to be > 0
  end
end
