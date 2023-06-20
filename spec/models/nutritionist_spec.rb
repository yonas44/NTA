require 'rails_helper'

RSpec.describe Nutritionist do
  let(:user) { FactoryBot.create(:user, role: 'nutritionist')}
  let(:first_nutritionist) { FactoryBot.create(:nutritionist, user: ) }

  it 'creates a client record in database' do
    first_nutritionist
    expect(described_class.count).to be > 0
  end
end
