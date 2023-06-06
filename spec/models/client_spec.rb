require 'rails_helper'

RSpec.describe Client do
  let(:first_client) { create(:client) }

  it 'creates a client record in database' do
    first_client
    expect(described_class.count).to be > 0
  end
end
