require 'rails_helper'

RSpec.describe Nutritionist do
  let(:first_nutritionist) { create(:nutritionist) }

  it 'creates a client record in database' do
    first_nutritionist
    expect(described_class.count).to be > 0
  end
end
