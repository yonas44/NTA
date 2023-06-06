require 'rails_helper'

RSpec.describe Ingredient do
  let(:nutritionist) { create(:nutritionist) }
  let(:apple) { create(:ingredient, name: 'Apple', nutritionist:) }

  it 'creates an ingredient' do
    apple
    expect(described_class.count).to be > 0
  end
end
