require 'rails_helper'

RSpec.describe Ingredient do
  let(:user) { FactoryBot.create(:user, role: 'nutritionist')}
  let(:nutritionist) { FactoryBot.create(:nutritionist, user: ) }
  let(:apple) { FactoryBot.create(:ingredient, name: 'Apple', nutritionist: ) }

  it 'creates an ingredient' do
    apple
    expect(described_class.count).to be > 0
  end
end
