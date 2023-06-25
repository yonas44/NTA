require 'rails_helper'

RSpec.describe Client do
  let(:user) { FactoryBot.create(:user, role: 'client') }
  let(:first_client) { FactoryBot.create(:client, user:) }

  it 'creates a client record in database' do
    first_client
    expect(described_class.count).to be > 0
  end
end
